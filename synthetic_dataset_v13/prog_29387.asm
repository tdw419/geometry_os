; DESCRIPTION: Composite: Renders a cyan disk with center (111, 117) and radius 55 then Sets a single black pixel at (300, 69) then Places a yellow line segment connecting (32, 235) to (461, 97).
; PLAN: r0=111(x), r1=117(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=300(x), r6=69(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=32(x1), r11=235(y1), r12=461(x2), r13=97(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 111
LDI r1, 117
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 300
LDI r6, 69
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 32
LDI r11, 235
LDI r12, 461
LDI r13, 97
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
