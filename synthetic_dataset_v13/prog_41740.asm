; DESCRIPTION: Creates a orange rectangular region at (96, 131) spanning 103 by 116 pixels.
; PLAN: r0=96(x), r1=131(y), r2=103(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 131
LDI r2, 103
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
