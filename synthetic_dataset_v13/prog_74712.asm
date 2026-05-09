; DESCRIPTION: Creates a purple rectangular region at (161, 39) spanning 113 by 115 pixels.
; PLAN: r0=161(x), r1=39(y), r2=113(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 39
LDI r2, 113
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
