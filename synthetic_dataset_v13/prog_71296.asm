; DESCRIPTION: Creates a magenta rectangular region at (95, 109) spanning 45 by 81 pixels.
; PLAN: r0=95(x), r1=109(y), r2=45(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 109
LDI r2, 45
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
