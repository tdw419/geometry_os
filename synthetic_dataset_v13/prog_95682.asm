; DESCRIPTION: Composite: Sets a single cyan pixel at (237, 140) then Renders a cyan box of size 26x11 starting at (405, 88) then Draws a blue line from (401, 30) to (60, 135).
; PLAN: r0=237(x), r1=140(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=405(x), r6=88(y), r7=26(width), r8=11(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=401(x1), r11=30(y1), r12=60(x2), r13=135(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 237
LDI r1, 140
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 405
LDI r6, 88
LDI r7, 26
LDI r8, 11
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 401
LDI r11, 30
LDI r12, 60
LDI r13, 135
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
