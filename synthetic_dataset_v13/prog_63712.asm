; DESCRIPTION: Composite: Places a purple dot at position (125, 14) then Renders a cyan line between points (70, 242) and (288, 218) then Creates a cyan circular shape at (350, 130) with radius 46.
; PLAN: r0=125(x), r1=14(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=70(x1), r6=242(y1), r7=288(x2), r8=218(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=350(x), r11=130(y), r12=46(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 125
LDI r1, 14
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 70
LDI r6, 242
LDI r7, 288
LDI r8, 218
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 350
LDI r11, 130
LDI r12, 46
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
