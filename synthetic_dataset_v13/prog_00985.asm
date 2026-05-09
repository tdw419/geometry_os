; DESCRIPTION: Creates a white rectangular region at (206, 120) spanning 114 by 75 pixels.
; PLAN: r0=206(x), r1=120(y), r2=114(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 120
LDI r2, 114
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
