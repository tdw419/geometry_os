; DESCRIPTION: Creates a purple rectangular region at (380, 125) spanning 105 by 117 pixels.
; PLAN: r0=380(x), r1=125(y), r2=105(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 125
LDI r2, 105
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
