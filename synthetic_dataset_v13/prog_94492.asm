; DESCRIPTION: Creates a black rectangular region at (226, 20) spanning 48 by 47 pixels.
; PLAN: r0=226(x), r1=20(y), r2=48(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 20
LDI r2, 48
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
