; DESCRIPTION: Creates a green rectangular region at (75, 13) spanning 32 by 27 pixels.
; PLAN: r0=75(x), r1=13(y), r2=32(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 13
LDI r2, 32
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
