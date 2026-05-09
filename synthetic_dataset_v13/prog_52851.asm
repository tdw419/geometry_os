; DESCRIPTION: Composite: Places a purple 60x50 rectangle at position (183, 147) then Places a red dot at position (197, 241).
; PLAN: r0=183(x), r1=147(y), r2=60(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=197(x), r6=241(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 183
LDI r1, 147
LDI r2, 60
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 241
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
