; DESCRIPTION: Creates a blue rectangular region at (150, 44) spanning 37 by 13 pixels.
; PLAN: r0=150(x), r1=44(y), r2=37(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 44
LDI r2, 37
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
