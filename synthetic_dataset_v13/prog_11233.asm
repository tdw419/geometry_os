; DESCRIPTION: Creates a green rectangular region at (157, 16) spanning 80 by 27 pixels.
; PLAN: r0=157(x), r1=16(y), r2=80(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 16
LDI r2, 80
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
