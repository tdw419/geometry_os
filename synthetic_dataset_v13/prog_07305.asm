; DESCRIPTION: Creates a green rectangular region at (16, 133) spanning 17 by 93 pixels.
; PLAN: r0=16(x), r1=133(y), r2=17(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 133
LDI r2, 17
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
