; DESCRIPTION: Creates a green rectangular region at (258, 67) spanning 113 by 81 pixels.
; PLAN: r0=258(x), r1=67(y), r2=113(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 67
LDI r2, 113
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
