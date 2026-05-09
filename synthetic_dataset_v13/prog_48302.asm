; DESCRIPTION: Creates a blue rectangular region at (27, 86) spanning 77 by 114 pixels.
; PLAN: r0=27(x), r1=86(y), r2=77(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 86
LDI r2, 77
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
