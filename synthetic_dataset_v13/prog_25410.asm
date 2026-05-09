; DESCRIPTION: Composite: Places a purple dot at position (187, 230) then Places a green 105x82 rectangle at position (40, 163).
; PLAN: r0=187(x), r1=230(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=40(x), r6=163(y), r7=105(width), r8=82(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 187
LDI r1, 230
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 40
LDI r6, 163
LDI r7, 105
LDI r8, 82
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
