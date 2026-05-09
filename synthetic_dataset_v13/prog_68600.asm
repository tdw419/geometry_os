; DESCRIPTION: Composite: Places a yellow dot at position (195, 14) then Places a green 50x58 rectangle at position (47, 165).
; PLAN: r0=195(x), r1=14(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=47(x), r6=165(y), r7=50(width), r8=58(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 195
LDI r1, 14
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 47
LDI r6, 165
LDI r7, 50
LDI r8, 58
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
