; DESCRIPTION: Composite: Draws a purple circle centered at (61, 59) with radius 58 then Places a blue line segment connecting (405, 238) to (253, 171).
; PLAN: r0=61(x), r1=59(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=405(x1), r6=238(y1), r7=253(x2), r8=171(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 61
LDI r1, 59
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 405
LDI r6, 238
LDI r7, 253
LDI r8, 171
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
