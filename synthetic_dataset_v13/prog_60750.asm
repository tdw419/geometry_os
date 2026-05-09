; DESCRIPTION: Creates a blue rectangular region at (168, 70) spanning 18 by 75 pixels.
; PLAN: r0=168(x), r1=70(y), r2=18(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 70
LDI r2, 18
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
