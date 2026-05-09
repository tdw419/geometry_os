; DESCRIPTION: Composite: Draws a cyan circle centered at (197, 59) with radius 44 then Places a yellow line segment connecting (349, 162) to (289, 33).
; PLAN: r0=197(x), r1=59(y), r2=44(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=349(x1), r6=162(y1), r7=289(x2), r8=33(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 197
LDI r1, 59
LDI r2, 44
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 349
LDI r6, 162
LDI r7, 289
LDI r8, 33
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
