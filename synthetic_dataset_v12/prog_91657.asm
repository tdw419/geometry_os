; DESCRIPTION: Creates a orange rectangular region at (308, 27) spanning 38 by 39 pixels.
; PLAN: r0=308(x), r1=27(y), r2=38(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 27
LDI r2, 38
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
