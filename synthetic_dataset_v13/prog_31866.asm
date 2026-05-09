; DESCRIPTION: Renders a white box of size 60x115 starting at (228, 101).
; PLAN: r0=228(x), r1=101(y), r2=60(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 101
LDI r2, 60
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
