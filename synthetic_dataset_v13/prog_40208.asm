; DESCRIPTION: Composite: Places a white circle of radius 70 at center (397, 142) then Places a magenta dot at position (263, 131).
; PLAN: r0=397(x), r1=142(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=263(x), r6=131(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 397
LDI r1, 142
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 263
LDI r6, 131
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
