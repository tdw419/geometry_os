; DESCRIPTION: Creates a white rectangular region at (30, 74) spanning 103 by 97 pixels.
; PLAN: r0=30(x), r1=74(y), r2=103(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 74
LDI r2, 103
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
