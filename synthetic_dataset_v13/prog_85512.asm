; DESCRIPTION: Creates a orange rectangular region at (356, 226) spanning 91 by 23 pixels.
; PLAN: r0=356(x), r1=226(y), r2=91(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 226
LDI r2, 91
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
