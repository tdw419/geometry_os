; DESCRIPTION: Creates a blue rectangular region at (366, 48) spanning 92 by 120 pixels.
; PLAN: r0=366(x), r1=48(y), r2=92(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 48
LDI r2, 92
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
