; DESCRIPTION: Creates a blue rectangular region at (41, 165) spanning 27 by 75 pixels.
; PLAN: r0=41(x), r1=165(y), r2=27(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 165
LDI r2, 27
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
