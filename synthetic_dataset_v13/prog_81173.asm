; DESCRIPTION: Creates a green rectangular region at (296, 52) spanning 81 by 87 pixels.
; PLAN: r0=296(x), r1=52(y), r2=81(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 52
LDI r2, 81
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
