; DESCRIPTION: Composite: Creates a blue circular shape at (221, 59) with radius 19 then Places a cyan dot at position (244, 69).
; PLAN: r0=221(x), r1=59(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=244(x), r6=69(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 221
LDI r1, 59
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 244
LDI r6, 69
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
