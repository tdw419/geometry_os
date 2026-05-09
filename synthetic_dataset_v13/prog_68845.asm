; DESCRIPTION: Creates a green rectangular region at (220, 133) spanning 45 by 11 pixels.
; PLAN: r0=220(x), r1=133(y), r2=45(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 133
LDI r2, 45
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
