; DESCRIPTION: Creates a purple rectangular region at (146, 231) spanning 88 by 17 pixels.
; PLAN: r0=146(x), r1=231(y), r2=88(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 231
LDI r2, 88
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
