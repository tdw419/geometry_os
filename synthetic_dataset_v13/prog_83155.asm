; DESCRIPTION: Creates a blue rectangular region at (180, 94) spanning 77 by 114 pixels.
; PLAN: r0=180(x), r1=94(y), r2=77(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 94
LDI r2, 77
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
