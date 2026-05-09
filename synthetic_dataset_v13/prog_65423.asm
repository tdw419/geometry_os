; DESCRIPTION: Composite: Places a orange 102x46 rectangle at position (100, 120) then Places a purple dot at position (192, 238).
; PLAN: r0=100(x), r1=120(y), r2=102(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=192(x), r6=238(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 100
LDI r1, 120
LDI r2, 102
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 238
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
