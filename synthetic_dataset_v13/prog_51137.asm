; DESCRIPTION: Creates a white rectangular region at (70, 176) spanning 65 by 21 pixels.
; PLAN: r0=70(x), r1=176(y), r2=65(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 176
LDI r2, 65
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
