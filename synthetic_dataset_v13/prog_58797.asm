; DESCRIPTION: Creates a red rectangular region at (419, 17) spanning 73 by 111 pixels.
; PLAN: r0=419(x), r1=17(y), r2=73(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 17
LDI r2, 73
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
