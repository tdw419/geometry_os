; DESCRIPTION: Creates a green rectangular region at (315, 22) spanning 42 by 31 pixels.
; PLAN: r0=315(x), r1=22(y), r2=42(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 22
LDI r2, 42
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
