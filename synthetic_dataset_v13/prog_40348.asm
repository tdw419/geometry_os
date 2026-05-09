; DESCRIPTION: Creates a blue rectangular region at (221, 14) spanning 50 by 68 pixels.
; PLAN: r0=221(x), r1=14(y), r2=50(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 14
LDI r2, 50
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
