; DESCRIPTION: Creates a blue rectangular region at (233, 91) spanning 60 by 27 pixels.
; PLAN: r0=233(x), r1=91(y), r2=60(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 91
LDI r2, 60
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
