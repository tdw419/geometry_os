; DESCRIPTION: Creates a red rectangular region at (434, 116) spanning 69 by 89 pixels.
; PLAN: r0=434(x), r1=116(y), r2=69(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 116
LDI r2, 69
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
