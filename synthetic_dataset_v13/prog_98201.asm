; DESCRIPTION: Creates a green rectangular region at (281, 9) spanning 115 by 70 pixels.
; PLAN: r0=281(x), r1=9(y), r2=115(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 9
LDI r2, 115
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
