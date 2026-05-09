; DESCRIPTION: Renders a magenta box of size 18x116 starting at (408, 47).
; PLAN: r0=408(x), r1=47(y), r2=18(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 47
LDI r2, 18
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
