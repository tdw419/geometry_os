; DESCRIPTION: Renders a magenta box of size 79x16 starting at (233, 238).
; PLAN: r0=233(x), r1=238(y), r2=79(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 238
LDI r2, 79
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
