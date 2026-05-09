; DESCRIPTION: Creates a purple rectangular region at (273, 159) spanning 84 by 16 pixels.
; PLAN: r0=273(x), r1=159(y), r2=84(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 159
LDI r2, 84
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
