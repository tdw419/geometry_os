; DESCRIPTION: Creates a blue rectangular region at (125, 117) spanning 103 by 65 pixels.
; PLAN: r0=125(x), r1=117(y), r2=103(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 117
LDI r2, 103
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
