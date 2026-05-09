; DESCRIPTION: Creates a green rectangular region at (440, 148) spanning 36 by 68 pixels.
; PLAN: r0=440(x), r1=148(y), r2=36(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 148
LDI r2, 36
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
