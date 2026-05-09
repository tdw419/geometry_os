; DESCRIPTION: Creates a green rectangular region at (279, 97) spanning 59 by 74 pixels.
; PLAN: r0=279(x), r1=97(y), r2=59(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 97
LDI r2, 59
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
