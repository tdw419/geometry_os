; DESCRIPTION: Creates a purple rectangular region at (207, 53) spanning 45 by 80 pixels.
; PLAN: r0=207(x), r1=53(y), r2=45(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 53
LDI r2, 45
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
