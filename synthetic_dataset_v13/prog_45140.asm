; DESCRIPTION: Creates a blue rectangular region at (303, 161) spanning 120 by 63 pixels.
; PLAN: r0=303(x), r1=161(y), r2=120(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 161
LDI r2, 120
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
