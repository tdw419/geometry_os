; DESCRIPTION: Renders a magenta box of size 36x115 starting at (60, 96).
; PLAN: r0=60(x), r1=96(y), r2=36(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 96
LDI r2, 36
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
