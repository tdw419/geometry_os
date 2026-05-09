; DESCRIPTION: Creates a blue rectangular region at (58, 151) spanning 48 by 59 pixels.
; PLAN: r0=58(x), r1=151(y), r2=48(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 151
LDI r2, 48
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
