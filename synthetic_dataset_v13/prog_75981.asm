; DESCRIPTION: Creates a white rectangular region at (320, 61) spanning 111 by 25 pixels.
; PLAN: r0=320(x), r1=61(y), r2=111(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 61
LDI r2, 111
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
