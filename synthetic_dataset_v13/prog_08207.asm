; DESCRIPTION: Creates a blue rectangular region at (27, 80) spanning 70 by 45 pixels.
; PLAN: r0=27(x), r1=80(y), r2=70(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 80
LDI r2, 70
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
