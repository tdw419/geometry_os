; DESCRIPTION: Creates a white rectangular region at (333, 135) spanning 85 by 25 pixels.
; PLAN: r0=333(x), r1=135(y), r2=85(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 135
LDI r2, 85
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
