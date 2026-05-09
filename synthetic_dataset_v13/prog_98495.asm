; DESCRIPTION: Creates a cyan rectangular region at (416, 22) spanning 89 by 120 pixels.
; PLAN: r0=416(x), r1=22(y), r2=89(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 22
LDI r2, 89
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
