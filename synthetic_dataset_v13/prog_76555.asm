; DESCRIPTION: Composite: Renders a green box of size 45x106 starting at (400, 70) then Creates a black circular shape at (398, 93) with radius 47.
; PLAN: r0=400(x), r1=70(y), r2=45(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=398(x), r6=93(y), r7=47(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 400
LDI r1, 70
LDI r2, 45
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 398
LDI r6, 93
LDI r7, 47
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
