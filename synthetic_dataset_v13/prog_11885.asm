; DESCRIPTION: Creates a black rectangular region at (218, 16) spanning 63 by 68 pixels.
; PLAN: r0=218(x), r1=16(y), r2=63(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 16
LDI r2, 63
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
