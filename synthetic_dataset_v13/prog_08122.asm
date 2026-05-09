; DESCRIPTION: Creates a green rectangular region at (308, 84) spanning 68 by 85 pixels.
; PLAN: r0=308(x), r1=84(y), r2=68(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 84
LDI r2, 68
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
