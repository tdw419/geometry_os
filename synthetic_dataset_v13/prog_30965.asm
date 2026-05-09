; DESCRIPTION: Creates a green rectangular region at (111, 128) spanning 95 by 51 pixels.
; PLAN: r0=111(x), r1=128(y), r2=95(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 128
LDI r2, 95
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
