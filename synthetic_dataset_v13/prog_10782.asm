; DESCRIPTION: Creates a orange rectangular region at (420, 143) spanning 15 by 90 pixels.
; PLAN: r0=420(x), r1=143(y), r2=15(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 143
LDI r2, 15
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
