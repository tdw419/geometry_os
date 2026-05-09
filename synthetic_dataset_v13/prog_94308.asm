; DESCRIPTION: Composite: Places a red 83x108 rectangle at position (352, 16) then Places a purple dot at position (469, 237).
; PLAN: r0=352(x), r1=16(y), r2=83(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=469(x), r6=237(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 352
LDI r1, 16
LDI r2, 83
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 469
LDI r6, 237
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
