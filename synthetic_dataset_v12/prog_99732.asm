; DESCRIPTION: Creates a white rectangular region at (185, 135) spanning 16 by 74 pixels.
; PLAN: r0=185(x), r1=135(y), r2=16(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 135
LDI r2, 16
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
