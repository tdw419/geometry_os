; DESCRIPTION: Creates a orange rectangular region at (275, 229) spanning 34 by 27 pixels.
; PLAN: r0=275(x), r1=229(y), r2=34(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 229
LDI r2, 34
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
