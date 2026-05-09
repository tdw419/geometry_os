; DESCRIPTION: Creates a blue rectangular region at (12, 44) spanning 117 by 25 pixels.
; PLAN: r0=12(x), r1=44(y), r2=117(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 44
LDI r2, 117
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
