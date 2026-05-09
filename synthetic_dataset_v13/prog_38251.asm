; DESCRIPTION: Creates a green rectangular region at (392, 102) spanning 14 by 28 pixels.
; PLAN: r0=392(x), r1=102(y), r2=14(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 102
LDI r2, 14
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
