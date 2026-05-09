; DESCRIPTION: Composite: Places a red 50x47 rectangle at position (7, 30) then Places a purple dot at position (108, 145).
; PLAN: r0=7(x), r1=30(y), r2=50(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=108(x), r6=145(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 7
LDI r1, 30
LDI r2, 50
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 145
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
