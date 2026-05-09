; DESCRIPTION: Creates a blue rectangular region at (26, 150) spanning 68 by 98 pixels.
; PLAN: r0=26(x), r1=150(y), r2=68(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 150
LDI r2, 68
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
