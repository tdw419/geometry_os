; DESCRIPTION: Creates a blue rectangular region at (450, 24) spanning 47 by 23 pixels.
; PLAN: r0=450(x), r1=24(y), r2=47(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 24
LDI r2, 47
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
