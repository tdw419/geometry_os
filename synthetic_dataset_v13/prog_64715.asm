; DESCRIPTION: Composite: Places a white circle of radius 51 at center (354, 69) then Places a magenta dot at position (465, 127).
; PLAN: r0=354(x), r1=69(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=465(x), r6=127(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 354
LDI r1, 69
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 465
LDI r6, 127
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
