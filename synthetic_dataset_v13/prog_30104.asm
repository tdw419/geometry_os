; DESCRIPTION: Creates a green rectangular region at (220, 184) spanning 27 by 21 pixels.
; PLAN: r0=220(x), r1=184(y), r2=27(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 184
LDI r2, 27
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
