; DESCRIPTION: Composite: Places a green 104x51 rectangle at position (247, 102) then Places a blue dot at position (270, 6).
; PLAN: r0=247(x), r1=102(y), r2=104(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=270(x), r6=6(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 247
LDI r1, 102
LDI r2, 104
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 6
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
