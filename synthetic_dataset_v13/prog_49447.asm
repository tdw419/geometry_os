; DESCRIPTION: Creates a blue rectangular region at (370, 151) spanning 93 by 104 pixels.
; PLAN: r0=370(x), r1=151(y), r2=93(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 151
LDI r2, 93
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
