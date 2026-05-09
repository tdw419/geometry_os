; DESCRIPTION: Renders a magenta box of size 72x42 starting at (41, 116).
; PLAN: r0=41(x), r1=116(y), r2=72(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 116
LDI r2, 72
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
