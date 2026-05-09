; DESCRIPTION: Creates a purple rectangular region at (306, 59) spanning 113 by 115 pixels.
; PLAN: r0=306(x), r1=59(y), r2=113(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 59
LDI r2, 113
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
