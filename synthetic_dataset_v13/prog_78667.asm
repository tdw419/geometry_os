; DESCRIPTION: Creates a orange rectangular region at (340, 13) spanning 70 by 77 pixels.
; PLAN: r0=340(x), r1=13(y), r2=70(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 13
LDI r2, 70
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
