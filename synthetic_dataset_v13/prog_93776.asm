; DESCRIPTION: Composite: Sets a single cyan pixel at (443, 56) then Draws a magenta line from (288, 18) to (24, 94) then Renders a blue box of size 37x24 starting at (422, 95).
; PLAN: r0=443(x), r1=56(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=288(x1), r6=18(y1), r7=24(x2), r8=94(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=422(x), r11=95(y), r12=37(width), r13=24(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 443
LDI r1, 56
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 288
LDI r6, 18
LDI r7, 24
LDI r8, 94
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 422
LDI r11, 95
LDI r12, 37
LDI r13, 24
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
