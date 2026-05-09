; DESCRIPTION: Creates a black rectangular region at (282, 32) spanning 91 by 27 pixels.
; PLAN: r0=282(x), r1=32(y), r2=91(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 32
LDI r2, 91
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
