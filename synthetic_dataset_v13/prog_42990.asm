; DESCRIPTION: Composite: Places a red circle of radius 69 at center (96, 115) then Places a black line segment connecting (480, 188) to (113, 45).
; PLAN: r0=96(x), r1=115(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=480(x1), r6=188(y1), r7=113(x2), r8=45(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 96
LDI r1, 115
LDI r2, 69
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 480
LDI r6, 188
LDI r7, 113
LDI r8, 45
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
