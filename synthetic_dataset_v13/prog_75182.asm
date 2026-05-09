; DESCRIPTION: Creates a orange rectangular region at (270, 143) spanning 49 by 59 pixels.
; PLAN: r0=270(x), r1=143(y), r2=49(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 143
LDI r2, 49
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
