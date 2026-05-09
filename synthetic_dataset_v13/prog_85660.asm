; DESCRIPTION: Composite: Places a magenta circle of radius 32 at center (103, 120) then Places a purple dot at position (77, 50).
; PLAN: r0=103(x), r1=120(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=77(x), r6=50(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 103
LDI r1, 120
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 77
LDI r6, 50
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
