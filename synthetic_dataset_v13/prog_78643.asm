; DESCRIPTION: Renders a green box of size 42x107 starting at (241, 93).
; PLAN: r0=241(x), r1=93(y), r2=42(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 93
LDI r2, 42
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
