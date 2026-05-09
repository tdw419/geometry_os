; DESCRIPTION: Creates a blue rectangular region at (103, 11) spanning 103 by 86 pixels.
; PLAN: r0=103(x), r1=11(y), r2=103(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 11
LDI r2, 103
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
