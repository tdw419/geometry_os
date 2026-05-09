; DESCRIPTION: Creates a white rectangular region at (63, 48) spanning 101 by 58 pixels.
; PLAN: r0=63(x), r1=48(y), r2=101(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 48
LDI r2, 101
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
