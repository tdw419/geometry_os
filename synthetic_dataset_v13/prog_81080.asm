; DESCRIPTION: Renders a magenta box of size 116x32 starting at (365, 165).
; PLAN: r0=365(x), r1=165(y), r2=116(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 165
LDI r2, 116
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
