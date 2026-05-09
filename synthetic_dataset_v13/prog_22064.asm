; DESCRIPTION: Creates a purple rectangular region at (85, 197) spanning 52 by 45 pixels.
; PLAN: r0=85(x), r1=197(y), r2=52(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 197
LDI r2, 52
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
