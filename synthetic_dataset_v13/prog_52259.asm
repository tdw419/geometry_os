; DESCRIPTION: Creates a red rectangular region at (32, 80) spanning 87 by 22 pixels.
; PLAN: r0=32(x), r1=80(y), r2=87(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 80
LDI r2, 87
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
