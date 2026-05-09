; DESCRIPTION: Creates a orange rectangular region at (392, 14) spanning 119 by 90 pixels.
; PLAN: r0=392(x), r1=14(y), r2=119(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 14
LDI r2, 119
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
