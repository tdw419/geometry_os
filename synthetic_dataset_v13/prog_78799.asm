; DESCRIPTION: Creates a orange rectangular region at (209, 34) spanning 44 by 86 pixels.
; PLAN: r0=209(x), r1=34(y), r2=44(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 34
LDI r2, 44
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
