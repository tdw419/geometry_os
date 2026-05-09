; DESCRIPTION: Creates a blue rectangular region at (196, 220) spanning 61 by 20 pixels.
; PLAN: r0=196(x), r1=220(y), r2=61(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 220
LDI r2, 61
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
