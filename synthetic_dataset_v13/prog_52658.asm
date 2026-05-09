; DESCRIPTION: Renders a magenta box of size 115x109 starting at (346, 121).
; PLAN: r0=346(x), r1=121(y), r2=115(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 121
LDI r2, 115
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
