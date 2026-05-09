; DESCRIPTION: Creates a purple rectangular region at (243, 72) spanning 19 by 91 pixels.
; PLAN: r0=243(x), r1=72(y), r2=19(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 72
LDI r2, 19
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
