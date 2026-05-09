; DESCRIPTION: Creates a yellow rectangular region at (256, 112) spanning 16 by 108 pixels.
; PLAN: r0=256(x), r1=112(y), r2=16(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 112
LDI r2, 16
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
