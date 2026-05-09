; DESCRIPTION: Creates a blue rectangular region at (386, 16) spanning 118 by 27 pixels.
; PLAN: r0=386(x), r1=16(y), r2=118(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 16
LDI r2, 118
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
