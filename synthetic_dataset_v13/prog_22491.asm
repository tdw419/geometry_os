; DESCRIPTION: Creates a black rectangular region at (180, 112) spanning 119 by 93 pixels.
; PLAN: r0=180(x), r1=112(y), r2=119(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 112
LDI r2, 119
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
