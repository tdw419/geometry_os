; DESCRIPTION: Creates a black rectangular region at (135, 144) spanning 66 by 27 pixels.
; PLAN: r0=135(x), r1=144(y), r2=66(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 144
LDI r2, 66
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
