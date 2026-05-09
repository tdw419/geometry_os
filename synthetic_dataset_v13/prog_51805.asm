; DESCRIPTION: Creates a green rectangular region at (346, 81) spanning 36 by 87 pixels.
; PLAN: r0=346(x), r1=81(y), r2=36(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 81
LDI r2, 36
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
