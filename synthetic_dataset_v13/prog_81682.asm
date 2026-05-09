; DESCRIPTION: Creates a blue rectangular region at (11, 150) spanning 93 by 25 pixels.
; PLAN: r0=11(x), r1=150(y), r2=93(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 150
LDI r2, 93
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
