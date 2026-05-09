; DESCRIPTION: Creates a purple rectangular region at (322, 202) spanning 64 by 14 pixels.
; PLAN: r0=322(x), r1=202(y), r2=64(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 202
LDI r2, 64
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
