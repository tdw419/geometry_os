; DESCRIPTION: Creates a orange rectangular region at (259, 32) spanning 47 by 95 pixels.
; PLAN: r0=259(x), r1=32(y), r2=47(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 32
LDI r2, 47
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
