; DESCRIPTION: Creates a yellow rectangular region at (209, 136) spanning 103 by 95 pixels.
; PLAN: r0=209(x), r1=136(y), r2=103(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 136
LDI r2, 103
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
