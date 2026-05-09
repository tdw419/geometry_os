; DESCRIPTION: Creates a orange rectangular region at (71, 137) spanning 17 by 10 pixels.
; PLAN: r0=71(x), r1=137(y), r2=17(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 137
LDI r2, 17
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
