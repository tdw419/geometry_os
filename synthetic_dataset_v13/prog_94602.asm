; DESCRIPTION: Creates a yellow rectangular region at (215, 95) spanning 95 by 119 pixels.
; PLAN: r0=215(x), r1=95(y), r2=95(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 95
LDI r2, 95
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
