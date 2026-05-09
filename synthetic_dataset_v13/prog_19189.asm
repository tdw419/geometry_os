; DESCRIPTION: Composite: Renders a black line between points (77, 114) and (392, 228) then Places a green circle of radius 69 at center (207, 148) then Places a blue dot at position (357, 222).
; PLAN: r0=77(x1), r1=114(y1), r2=392(x2), r3=228(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=207(x), r6=148(y), r7=69(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=357(x), r11=222(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 77
LDI r1, 114
LDI r2, 392
LDI r3, 228
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 148
LDI r7, 69
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 357
LDI r11, 222
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
