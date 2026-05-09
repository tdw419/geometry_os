; DESCRIPTION: Composite: Draws a blue circle centered at (51, 120) with radius 16 then Places a red dot at position (146, 102).
; PLAN: r0=51(x), r1=120(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=146(x), r6=102(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 51
LDI r1, 120
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 146
LDI r6, 102
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
