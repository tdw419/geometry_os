; DESCRIPTION: Creates a blue rectangular region at (430, 125) spanning 21 by 120 pixels.
; PLAN: r0=430(x), r1=125(y), r2=21(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 125
LDI r2, 21
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
