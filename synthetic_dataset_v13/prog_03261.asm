; DESCRIPTION: Creates a yellow rectangular region at (374, 32) spanning 24 by 52 pixels.
; PLAN: r0=374(x), r1=32(y), r2=24(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 32
LDI r2, 24
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
