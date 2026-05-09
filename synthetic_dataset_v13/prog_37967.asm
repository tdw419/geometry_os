; DESCRIPTION: Creates a purple rectangular region at (245, 134) spanning 70 by 40 pixels.
; PLAN: r0=245(x), r1=134(y), r2=70(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 134
LDI r2, 70
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
