; DESCRIPTION: Creates a orange rectangular region at (320, 69) spanning 56 by 90 pixels.
; PLAN: r0=320(x), r1=69(y), r2=56(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 69
LDI r2, 56
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
