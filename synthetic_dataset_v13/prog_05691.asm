; DESCRIPTION: Creates a yellow rectangular region at (186, 70) spanning 81 by 63 pixels.
; PLAN: r0=186(x), r1=70(y), r2=81(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 70
LDI r2, 81
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
