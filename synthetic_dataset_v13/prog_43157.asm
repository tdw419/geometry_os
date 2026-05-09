; DESCRIPTION: Creates a white rectangular region at (358, 64) spanning 111 by 90 pixels.
; PLAN: r0=358(x), r1=64(y), r2=111(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 64
LDI r2, 111
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
