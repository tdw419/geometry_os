; DESCRIPTION: Creates a blue rectangular region at (91, 14) spanning 90 by 77 pixels.
; PLAN: r0=91(x), r1=14(y), r2=90(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 14
LDI r2, 90
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
