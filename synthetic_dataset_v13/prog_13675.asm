; DESCRIPTION: Creates a purple rectangular region at (197, 180) spanning 89 by 65 pixels.
; PLAN: r0=197(x), r1=180(y), r2=89(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 180
LDI r2, 89
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
