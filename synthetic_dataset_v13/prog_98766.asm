; DESCRIPTION: Creates a cyan rectangular region at (118, 147) spanning 69 by 19 pixels.
; PLAN: r0=118(x), r1=147(y), r2=69(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 147
LDI r2, 69
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
