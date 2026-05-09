; DESCRIPTION: Renders a magenta box of size 116x109 starting at (349, 142).
; PLAN: r0=349(x), r1=142(y), r2=116(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 142
LDI r2, 116
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
