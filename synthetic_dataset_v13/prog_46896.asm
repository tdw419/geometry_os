; DESCRIPTION: Creates a blue rectangular region at (374, 114) spanning 93 by 72 pixels.
; PLAN: r0=374(x), r1=114(y), r2=93(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 114
LDI r2, 93
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
