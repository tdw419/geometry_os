; DESCRIPTION: Creates a orange rectangular region at (417, 90) spanning 50 by 96 pixels.
; PLAN: r0=417(x), r1=90(y), r2=50(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 90
LDI r2, 50
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
