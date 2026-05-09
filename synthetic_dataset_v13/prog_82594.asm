; DESCRIPTION: Creates a red rectangular region at (358, 110) spanning 32 by 111 pixels.
; PLAN: r0=358(x), r1=110(y), r2=32(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 110
LDI r2, 32
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
