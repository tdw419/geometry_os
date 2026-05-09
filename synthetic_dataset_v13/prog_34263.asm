; DESCRIPTION: Creates a white rectangular region at (345, 65) spanning 21 by 109 pixels.
; PLAN: r0=345(x), r1=65(y), r2=21(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 65
LDI r2, 21
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
