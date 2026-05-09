; DESCRIPTION: Creates a green rectangular region at (130, 33) spanning 42 by 110 pixels.
; PLAN: r0=130(x), r1=33(y), r2=42(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 33
LDI r2, 42
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
