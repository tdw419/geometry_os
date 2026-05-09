; DESCRIPTION: Creates a yellow rectangular region at (66, 21) spanning 84 by 27 pixels.
; PLAN: r0=66(x), r1=21(y), r2=84(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 21
LDI r2, 84
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
