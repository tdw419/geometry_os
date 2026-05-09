; DESCRIPTION: Creates a green rectangular region at (386, 193) spanning 96 by 37 pixels.
; PLAN: r0=386(x), r1=193(y), r2=96(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 193
LDI r2, 96
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
