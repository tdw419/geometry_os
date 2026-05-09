; DESCRIPTION: Creates a green rectangular region at (243, 122) spanning 113 by 94 pixels.
; PLAN: r0=243(x), r1=122(y), r2=113(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 122
LDI r2, 113
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
