; DESCRIPTION: Creates a green rectangular region at (232, 225) spanning 50 by 24 pixels.
; PLAN: r0=232(x), r1=225(y), r2=50(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 225
LDI r2, 50
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
