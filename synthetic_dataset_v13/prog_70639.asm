; DESCRIPTION: Renders a green box of size 81x66 starting at (238, 107).
; PLAN: r0=238(x), r1=107(y), r2=81(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 107
LDI r2, 81
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
