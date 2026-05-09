; DESCRIPTION: Creates a yellow rectangular region at (77, 150) spanning 25 by 81 pixels.
; PLAN: r0=77(x), r1=150(y), r2=25(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 150
LDI r2, 25
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
