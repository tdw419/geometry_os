; DESCRIPTION: Creates a yellow rectangular region at (340, 136) spanning 96 by 50 pixels.
; PLAN: r0=340(x), r1=136(y), r2=96(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 136
LDI r2, 96
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
