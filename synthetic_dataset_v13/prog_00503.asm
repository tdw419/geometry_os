; DESCRIPTION: Creates a orange rectangular region at (320, 73) spanning 90 by 61 pixels.
; PLAN: r0=320(x), r1=73(y), r2=90(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 73
LDI r2, 90
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
