; DESCRIPTION: Creates a white rectangular region at (226, 25) spanning 30 by 117 pixels.
; PLAN: r0=226(x), r1=25(y), r2=30(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 25
LDI r2, 30
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
