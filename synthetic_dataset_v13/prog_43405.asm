; DESCRIPTION: Creates a green rectangular region at (183, 125) spanning 81 by 107 pixels.
; PLAN: r0=183(x), r1=125(y), r2=81(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 125
LDI r2, 81
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
