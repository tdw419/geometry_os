; DESCRIPTION: Composite: Creates a yellow circular shape at (279, 140) with radius 52 then Places a black dot at position (473, 63) then Places a orange line segment connecting (502, 211) to (46, 154).
; PLAN: r0=279(x), r1=140(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=473(x), r6=63(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=502(x1), r11=211(y1), r12=46(x2), r13=154(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 279
LDI r1, 140
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 473
LDI r6, 63
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 502
LDI r11, 211
LDI r12, 46
LDI r13, 154
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
