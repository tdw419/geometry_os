; DESCRIPTION: Creates a yellow rectangular region at (126, 32) spanning 95 by 75 pixels.
; PLAN: r0=126(x), r1=32(y), r2=95(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 32
LDI r2, 95
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
