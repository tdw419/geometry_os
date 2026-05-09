; DESCRIPTION: Creates a purple rectangular region at (80, 117) spanning 53 by 59 pixels.
; PLAN: r0=80(x), r1=117(y), r2=53(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 117
LDI r2, 53
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
