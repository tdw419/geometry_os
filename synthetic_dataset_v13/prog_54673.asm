; DESCRIPTION: Composite: Places a orange 118x21 rectangle at position (131, 79) then Places a magenta dot at position (388, 20).
; PLAN: r0=131(x), r1=79(y), r2=118(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=388(x), r6=20(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 131
LDI r1, 79
LDI r2, 118
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 20
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
