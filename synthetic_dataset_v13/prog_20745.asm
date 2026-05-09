; DESCRIPTION: Creates a purple rectangular region at (346, 115) spanning 105 by 117 pixels.
; PLAN: r0=346(x), r1=115(y), r2=105(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 115
LDI r2, 105
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
