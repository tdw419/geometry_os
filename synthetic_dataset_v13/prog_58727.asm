; DESCRIPTION: Creates a magenta rectangular region at (136, 120) spanning 50 by 116 pixels.
; PLAN: r0=136(x), r1=120(y), r2=50(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 120
LDI r2, 50
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
