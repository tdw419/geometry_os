; DESCRIPTION: Creates a green rectangular region at (153, 209) spanning 10 by 32 pixels.
; PLAN: r0=153(x), r1=209(y), r2=10(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 209
LDI r2, 10
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
