; DESCRIPTION: Creates a white rectangular region at (242, 70) spanning 13 by 106 pixels.
; PLAN: r0=242(x), r1=70(y), r2=13(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 70
LDI r2, 13
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
