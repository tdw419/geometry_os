; DESCRIPTION: Creates a white rectangular region at (231, 28) spanning 55 by 21 pixels.
; PLAN: r0=231(x), r1=28(y), r2=55(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 28
LDI r2, 55
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
