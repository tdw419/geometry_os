; DESCRIPTION: Creates a yellow rectangular region at (387, 137) spanning 38 by 74 pixels.
; PLAN: r0=387(x), r1=137(y), r2=38(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 137
LDI r2, 38
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
