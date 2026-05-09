; DESCRIPTION: Creates a red rectangular region at (0, 87) spanning 12 by 116 pixels.
; PLAN: r0=0(x), r1=87(y), r2=12(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 87
LDI r2, 12
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
