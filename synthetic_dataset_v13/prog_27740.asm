; DESCRIPTION: Creates a yellow rectangular region at (263, 163) spanning 87 by 63 pixels.
; PLAN: r0=263(x), r1=163(y), r2=87(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 163
LDI r2, 87
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
