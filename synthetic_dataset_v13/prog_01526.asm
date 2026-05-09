; DESCRIPTION: Creates a purple rectangular region at (107, 190) spanning 113 by 20 pixels.
; PLAN: r0=107(x), r1=190(y), r2=113(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 190
LDI r2, 113
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
