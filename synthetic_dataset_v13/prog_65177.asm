; DESCRIPTION: Creates a orange rectangular region at (54, 32) spanning 25 by 77 pixels.
; PLAN: r0=54(x), r1=32(y), r2=25(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 32
LDI r2, 25
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
