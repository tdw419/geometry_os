; DESCRIPTION: Creates a red rectangular region at (416, 127) spanning 77 by 52 pixels.
; PLAN: r0=416(x), r1=127(y), r2=77(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 127
LDI r2, 77
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
