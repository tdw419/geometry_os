; DESCRIPTION: Composite: Places a red 81x90 rectangle at position (26, 107) then Places a blue dot at position (65, 163).
; PLAN: r0=26(x), r1=107(y), r2=81(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=65(x), r6=163(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 26
LDI r1, 107
LDI r2, 81
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 163
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
