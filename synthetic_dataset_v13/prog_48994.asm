; DESCRIPTION: Creates a yellow rectangular region at (95, 86) spanning 52 by 38 pixels.
; PLAN: r0=95(x), r1=86(y), r2=52(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 86
LDI r2, 52
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
