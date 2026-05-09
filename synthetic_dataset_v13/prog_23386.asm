; DESCRIPTION: Creates a blue rectangular region at (149, 150) spanning 72 by 48 pixels.
; PLAN: r0=149(x), r1=150(y), r2=72(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 150
LDI r2, 72
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
