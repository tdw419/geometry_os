; DESCRIPTION: Renders a magenta box of size 55x105 starting at (246, 115).
; PLAN: r0=246(x), r1=115(y), r2=55(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 115
LDI r2, 55
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
