; DESCRIPTION: Creates a purple rectangular region at (197, 136) spanning 54 by 59 pixels.
; PLAN: r0=197(x), r1=136(y), r2=54(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 136
LDI r2, 54
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
