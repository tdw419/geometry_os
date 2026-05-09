; DESCRIPTION: Creates a blue rectangular region at (150, 135) spanning 93 by 29 pixels.
; PLAN: r0=150(x), r1=135(y), r2=93(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 135
LDI r2, 93
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
