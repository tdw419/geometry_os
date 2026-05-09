; DESCRIPTION: Composite: Draws a red circle centered at (236, 108) with radius 28 then Places a blue line segment connecting (60, 180) to (355, 151).
; PLAN: r0=236(x), r1=108(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=60(x1), r6=180(y1), r7=355(x2), r8=151(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 236
LDI r1, 108
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 60
LDI r6, 180
LDI r7, 355
LDI r8, 151
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
