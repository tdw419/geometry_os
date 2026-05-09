; DESCRIPTION: Creates a orange rectangular region at (245, 61) spanning 40 by 91 pixels.
; PLAN: r0=245(x), r1=61(y), r2=40(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 61
LDI r2, 40
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
