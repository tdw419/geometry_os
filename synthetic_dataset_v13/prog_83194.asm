; DESCRIPTION: Creates a orange rectangular region at (12, 179) spanning 93 by 36 pixels.
; PLAN: r0=12(x), r1=179(y), r2=93(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 179
LDI r2, 93
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
