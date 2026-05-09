; DESCRIPTION: Composite: Creates a white rectangular region at (139, 35) spanning 93 by 42 pixels then Places a green dot at position (220, 136).
; PLAN: r0=139(x), r1=35(y), r2=93(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=220(x), r6=136(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 139
LDI r1, 35
LDI r2, 93
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 136
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
