; DESCRIPTION: Composite: Creates a cyan circular shape at (303, 105) with radius 69 then Sets a single blue pixel at (356, 102) then Draws a blue line from (298, 253) to (386, 112).
; PLAN: r0=303(x), r1=105(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=356(x), r6=102(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=298(x1), r11=253(y1), r12=386(x2), r13=112(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 303
LDI r1, 105
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 356
LDI r6, 102
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 298
LDI r11, 253
LDI r12, 386
LDI r13, 112
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
