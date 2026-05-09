; DESCRIPTION: Creates a green rectangular region at (57, 133) spanning 45 by 43 pixels.
; PLAN: r0=57(x), r1=133(y), r2=45(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 133
LDI r2, 45
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
