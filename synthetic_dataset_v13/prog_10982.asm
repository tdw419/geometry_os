; DESCRIPTION: Creates a white rectangular region at (240, 131) spanning 97 by 109 pixels.
; PLAN: r0=240(x), r1=131(y), r2=97(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 131
LDI r2, 97
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
