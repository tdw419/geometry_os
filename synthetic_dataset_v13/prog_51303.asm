; DESCRIPTION: Creates a red rectangular region at (16, 23) spanning 80 by 81 pixels.
; PLAN: r0=16(x), r1=23(y), r2=80(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 23
LDI r2, 80
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
