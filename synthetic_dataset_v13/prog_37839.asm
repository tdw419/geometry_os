; DESCRIPTION: Creates a green rectangular region at (324, 164) spanning 80 by 48 pixels.
; PLAN: r0=324(x), r1=164(y), r2=80(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 164
LDI r2, 80
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
