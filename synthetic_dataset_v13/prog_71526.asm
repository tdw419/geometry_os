; DESCRIPTION: Creates a purple rectangular region at (398, 105) spanning 74 by 113 pixels.
; PLAN: r0=398(x), r1=105(y), r2=74(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 105
LDI r2, 74
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
