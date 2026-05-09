; DESCRIPTION: Creates a orange rectangular region at (68, 44) spanning 92 by 54 pixels.
; PLAN: r0=68(x), r1=44(y), r2=92(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 44
LDI r2, 92
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
