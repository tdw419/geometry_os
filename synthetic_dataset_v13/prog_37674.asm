; DESCRIPTION: Creates a purple rectangular region at (154, 48) spanning 110 by 91 pixels.
; PLAN: r0=154(x), r1=48(y), r2=110(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 48
LDI r2, 110
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
