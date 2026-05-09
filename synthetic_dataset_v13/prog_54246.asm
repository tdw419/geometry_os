; DESCRIPTION: Creates a white rectangular region at (281, 207) spanning 34 by 35 pixels.
; PLAN: r0=281(x), r1=207(y), r2=34(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 207
LDI r2, 34
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
