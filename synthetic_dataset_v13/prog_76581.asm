; DESCRIPTION: Renders a white box of size 82x73 starting at (307, 75).
; PLAN: r0=307(x), r1=75(y), r2=82(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 75
LDI r2, 82
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
