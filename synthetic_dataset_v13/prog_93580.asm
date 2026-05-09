; DESCRIPTION: Creates a yellow rectangular region at (218, 108) spanning 27 by 28 pixels.
; PLAN: r0=218(x), r1=108(y), r2=27(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 108
LDI r2, 27
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
