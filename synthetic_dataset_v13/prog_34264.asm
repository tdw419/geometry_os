; DESCRIPTION: Creates a green rectangular region at (154, 1) spanning 29 by 76 pixels.
; PLAN: r0=154(x), r1=1(y), r2=29(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 1
LDI r2, 29
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
