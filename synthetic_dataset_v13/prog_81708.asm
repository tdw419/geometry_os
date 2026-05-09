; DESCRIPTION: Creates a purple rectangular region at (197, 109) spanning 10 by 62 pixels.
; PLAN: r0=197(x), r1=109(y), r2=10(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 109
LDI r2, 10
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
