; DESCRIPTION: Creates a black rectangular region at (218, 78) spanning 91 by 67 pixels.
; PLAN: r0=218(x), r1=78(y), r2=91(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 78
LDI r2, 91
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
