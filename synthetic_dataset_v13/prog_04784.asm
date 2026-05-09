; DESCRIPTION: Creates a orange rectangular region at (277, 24) spanning 94 by 84 pixels.
; PLAN: r0=277(x), r1=24(y), r2=94(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 24
LDI r2, 94
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
