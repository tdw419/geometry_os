; DESCRIPTION: Composite: Places a red dot at position (282, 166) then Places a yellow circle of radius 12 at center (313, 180).
; PLAN: r0=282(x), r1=166(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=313(x), r6=180(y), r7=12(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 282
LDI r1, 166
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 313
LDI r6, 180
LDI r7, 12
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
