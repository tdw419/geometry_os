; DESCRIPTION: Composite: Places a blue line segment connecting (391, 59) to (124, 236) then Places a white circle of radius 70 at center (207, 140).
; PLAN: r0=391(x1), r1=59(y1), r2=124(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=207(x), r6=140(y), r7=70(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 391
LDI r1, 59
LDI r2, 124
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 140
LDI r7, 70
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
