; DESCRIPTION: Creates a blue rectangular region at (460, 101) spanning 44 by 72 pixels.
; PLAN: r0=460(x), r1=101(y), r2=44(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 101
LDI r2, 44
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
