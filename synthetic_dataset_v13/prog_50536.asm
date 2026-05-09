; DESCRIPTION: Composite: Renders a cyan box of size 60x43 starting at (409, 153) then Places a green line segment connecting (417, 90) to (176, 52) then Places a green dot at position (265, 104).
; PLAN: r0=409(x), r1=153(y), r2=60(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=417(x1), r6=90(y1), r7=176(x2), r8=52(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=265(x), r11=104(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 409
LDI r1, 153
LDI r2, 60
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 417
LDI r6, 90
LDI r7, 176
LDI r8, 52
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 265
LDI r11, 104
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
