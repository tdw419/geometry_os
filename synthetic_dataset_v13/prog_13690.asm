; DESCRIPTION: Composite: Renders a white box of size 107x49 starting at (233, 204) then Sets a single green pixel at (121, 29) then Places a magenta line segment connecting (259, 76) to (177, 138).
; PLAN: r0=233(x), r1=204(y), r2=107(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=121(x), r6=29(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=259(x1), r11=76(y1), r12=177(x2), r13=138(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 233
LDI r1, 204
LDI r2, 107
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 29
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 259
LDI r11, 76
LDI r12, 177
LDI r13, 138
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
