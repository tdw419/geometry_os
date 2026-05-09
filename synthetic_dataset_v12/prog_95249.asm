; DESCRIPTION: Composite: Places a orange dot at position (363, 3) then Places a white circle of radius 66 at center (444, 69) then Renders a yellow line between points (242, 228) and (180, 23).
; PLAN: r0=363(x), r1=3(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=444(x), r6=69(y), r7=66(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=242(x1), r11=228(y1), r12=180(x2), r13=23(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 363
LDI r1, 3
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 444
LDI r6, 69
LDI r7, 66
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 242
LDI r11, 228
LDI r12, 180
LDI r13, 23
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
