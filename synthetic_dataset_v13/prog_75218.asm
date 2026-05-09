; DESCRIPTION: Creates a green rectangular region at (371, 82) spanning 84 by 109 pixels.
; PLAN: r0=371(x), r1=82(y), r2=84(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 82
LDI r2, 84
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
