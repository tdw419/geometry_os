; DESCRIPTION: Composite: Sets a single green pixel at (405, 14) then Renders a cyan box of size 34x41 starting at (31, 12) then Places a purple line segment connecting (221, 19) to (429, 220).
; PLAN: r0=405(x), r1=14(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=31(x), r6=12(y), r7=34(width), r8=41(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=221(x1), r11=19(y1), r12=429(x2), r13=220(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 405
LDI r1, 14
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 31
LDI r6, 12
LDI r7, 34
LDI r8, 41
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 221
LDI r11, 19
LDI r12, 429
LDI r13, 220
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
