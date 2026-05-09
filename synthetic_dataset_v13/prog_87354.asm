; DESCRIPTION: Creates a purple rectangular region at (126, 93) spanning 19 by 38 pixels.
; PLAN: r0=126(x), r1=93(y), r2=19(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 93
LDI r2, 19
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
