; DESCRIPTION: Creates a yellow rectangular region at (403, 5) spanning 52 by 25 pixels.
; PLAN: r0=403(x), r1=5(y), r2=52(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 5
LDI r2, 52
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
