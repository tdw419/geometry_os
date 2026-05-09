; DESCRIPTION: Creates a blue rectangular region at (275, 7) spanning 118 by 111 pixels.
; PLAN: r0=275(x), r1=7(y), r2=118(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 7
LDI r2, 118
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
