; DESCRIPTION: Creates a green rectangular region at (338, 74) spanning 26 by 95 pixels.
; PLAN: r0=338(x), r1=74(y), r2=26(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 74
LDI r2, 26
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
