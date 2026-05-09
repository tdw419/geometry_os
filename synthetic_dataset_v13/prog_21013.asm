; DESCRIPTION: Creates a yellow rectangular region at (23, 245) spanning 57 by 10 pixels.
; PLAN: r0=23(x), r1=245(y), r2=57(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 245
LDI r2, 57
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
