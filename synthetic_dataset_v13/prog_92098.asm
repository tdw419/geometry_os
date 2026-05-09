; DESCRIPTION: Composite: Places a magenta line segment connecting (15, 178) to (494, 69) then Draws a cyan circle centered at (380, 157) with radius 45.
; PLAN: r0=15(x1), r1=178(y1), r2=494(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=380(x), r6=157(y), r7=45(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 15
LDI r1, 178
LDI r2, 494
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 380
LDI r6, 157
LDI r7, 45
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
