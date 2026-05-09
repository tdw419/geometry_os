; DESCRIPTION: Creates a orange rectangular region at (266, 9) spanning 47 by 120 pixels.
; PLAN: r0=266(x), r1=9(y), r2=47(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 9
LDI r2, 47
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
