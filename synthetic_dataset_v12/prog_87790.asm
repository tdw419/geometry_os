; DESCRIPTION: Creates a blue rectangular region at (330, 93) spanning 59 by 40 pixels.
; PLAN: r0=330(x), r1=93(y), r2=59(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 93
LDI r2, 59
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
