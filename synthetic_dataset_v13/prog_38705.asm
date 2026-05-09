; DESCRIPTION: Composite: Places a orange circle of radius 54 at center (243, 79) then Renders a white line between points (23, 194) and (101, 81) then Places a yellow dot at position (160, 46).
; PLAN: r0=243(x), r1=79(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=23(x1), r6=194(y1), r7=101(x2), r8=81(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=160(x), r11=46(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 243
LDI r1, 79
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 23
LDI r6, 194
LDI r7, 101
LDI r8, 81
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 160
LDI r11, 46
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
