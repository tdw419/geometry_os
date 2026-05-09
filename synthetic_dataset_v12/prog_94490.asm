; DESCRIPTION: Composite: Places a purple 88x63 rectangle at position (180, 143) then Places a purple dot at position (241, 24).
; PLAN: r0=180(x), r1=143(y), r2=88(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=241(x), r6=24(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 180
LDI r1, 143
LDI r2, 88
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 24
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
