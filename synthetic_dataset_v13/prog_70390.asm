; DESCRIPTION: Creates a red rectangular region at (239, 48) spanning 58 by 119 pixels.
; PLAN: r0=239(x), r1=48(y), r2=58(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 48
LDI r2, 58
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
