; DESCRIPTION: Creates a blue rectangular region at (196, 21) spanning 27 by 35 pixels.
; PLAN: r0=196(x), r1=21(y), r2=27(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 21
LDI r2, 27
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
