; DESCRIPTION: Creates a green rectangular region at (8, 60) spanning 95 by 28 pixels.
; PLAN: r0=8(x), r1=60(y), r2=95(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 60
LDI r2, 95
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
