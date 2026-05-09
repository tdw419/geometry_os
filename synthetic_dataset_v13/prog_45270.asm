; DESCRIPTION: Creates a blue rectangular region at (327, 92) spanning 96 by 113 pixels.
; PLAN: r0=327(x), r1=92(y), r2=96(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 92
LDI r2, 96
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
