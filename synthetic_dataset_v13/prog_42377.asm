; DESCRIPTION: Renders a magenta box of size 29x74 starting at (217, 96).
; PLAN: r0=217(x), r1=96(y), r2=29(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 96
LDI r2, 29
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
