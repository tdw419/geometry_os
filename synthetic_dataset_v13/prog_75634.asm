; DESCRIPTION: Creates a green rectangular region at (403, 122) spanning 32 by 85 pixels.
; PLAN: r0=403(x), r1=122(y), r2=32(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 122
LDI r2, 32
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
