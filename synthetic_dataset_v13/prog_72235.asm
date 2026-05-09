; DESCRIPTION: Creates a white rectangular region at (143, 220) spanning 75 by 25 pixels.
; PLAN: r0=143(x), r1=220(y), r2=75(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 220
LDI r2, 75
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
