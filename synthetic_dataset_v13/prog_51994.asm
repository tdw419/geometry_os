; DESCRIPTION: Composite: Draws a black circle centered at (242, 105) with radius 40 then Places a magenta dot at position (290, 1) then Renders a purple line between points (242, 220) and (221, 244).
; PLAN: r0=242(x), r1=105(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=290(x), r6=1(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=242(x1), r11=220(y1), r12=221(x2), r13=244(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 242
LDI r1, 105
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 290
LDI r6, 1
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 242
LDI r11, 220
LDI r12, 221
LDI r13, 244
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
