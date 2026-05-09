; DESCRIPTION: Creates a orange rectangular region at (179, 80) spanning 74 by 80 pixels.
; PLAN: r0=179(x), r1=80(y), r2=74(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 80
LDI r2, 74
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
