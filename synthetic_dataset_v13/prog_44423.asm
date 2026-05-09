; DESCRIPTION: Creates a yellow rectangular region at (173, 65) spanning 13 by 59 pixels.
; PLAN: r0=173(x), r1=65(y), r2=13(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 65
LDI r2, 13
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
