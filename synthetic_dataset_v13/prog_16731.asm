; DESCRIPTION: Creates a orange rectangular region at (85, 71) spanning 76 by 120 pixels.
; PLAN: r0=85(x), r1=71(y), r2=76(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 71
LDI r2, 76
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
