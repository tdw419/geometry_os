; DESCRIPTION: Creates a orange rectangular region at (150, 116) spanning 93 by 14 pixels.
; PLAN: r0=150(x), r1=116(y), r2=93(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 116
LDI r2, 93
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
