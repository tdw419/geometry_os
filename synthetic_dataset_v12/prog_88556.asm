; DESCRIPTION: Creates a purple rectangular region at (322, 74) spanning 27 by 25 pixels.
; PLAN: r0=322(x), r1=74(y), r2=27(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 74
LDI r2, 27
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
