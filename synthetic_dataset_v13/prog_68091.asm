; DESCRIPTION: Composite: Sets a single black pixel at (398, 113) then Places a magenta circle of radius 69 at center (216, 165).
; PLAN: r0=398(x), r1=113(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=216(x), r6=165(y), r7=69(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 398
LDI r1, 113
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 216
LDI r6, 165
LDI r7, 69
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
