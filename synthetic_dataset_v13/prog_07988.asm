; DESCRIPTION: Creates a orange rectangular region at (419, 42) spanning 90 by 75 pixels.
; PLAN: r0=419(x), r1=42(y), r2=90(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 42
LDI r2, 90
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
