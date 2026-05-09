; DESCRIPTION: Composite: Places a red 93x114 rectangle at position (92, 94) then Places a red dot at position (136, 29).
; PLAN: r0=92(x), r1=94(y), r2=93(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=136(x), r6=29(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 92
LDI r1, 94
LDI r2, 93
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 29
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
