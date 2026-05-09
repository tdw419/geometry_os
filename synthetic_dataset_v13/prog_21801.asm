; DESCRIPTION: Creates a white rectangular region at (113, 115) spanning 63 by 80 pixels.
; PLAN: r0=113(x), r1=115(y), r2=63(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 115
LDI r2, 63
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
