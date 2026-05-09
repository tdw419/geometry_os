; DESCRIPTION: Composite: Places a white 57x41 rectangle at position (156, 127) then Places a yellow dot at position (194, 127).
; PLAN: r0=156(x), r1=127(y), r2=57(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=194(x), r6=127(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 156
LDI r1, 127
LDI r2, 57
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 127
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
