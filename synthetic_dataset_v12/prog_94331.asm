; DESCRIPTION: Composite: Places a cyan circle of radius 77 at center (135, 84) then Renders a purple box of size 112x28 starting at (245, 210) then Draws a green line from (506, 89) to (18, 222).
; PLAN: r0=135(x), r1=84(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=245(x), r6=210(y), r7=112(width), r8=28(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=506(x1), r11=89(y1), r12=18(x2), r13=222(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 135
LDI r1, 84
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 245
LDI r6, 210
LDI r7, 112
LDI r8, 28
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 506
LDI r11, 89
LDI r12, 18
LDI r13, 222
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
