; DESCRIPTION: Creates a green rectangular region at (486, 42) spanning 23 by 22 pixels.
; PLAN: r0=486(x), r1=42(y), r2=23(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 42
LDI r2, 23
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
