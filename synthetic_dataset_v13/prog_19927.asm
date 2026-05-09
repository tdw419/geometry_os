; DESCRIPTION: Creates a blue rectangular region at (197, 4) spanning 22 by 10 pixels.
; PLAN: r0=197(x), r1=4(y), r2=22(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 4
LDI r2, 22
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
