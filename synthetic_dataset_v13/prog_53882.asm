; DESCRIPTION: Creates a white rectangular region at (231, 3) spanning 68 by 81 pixels.
; PLAN: r0=231(x), r1=3(y), r2=68(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 3
LDI r2, 68
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
