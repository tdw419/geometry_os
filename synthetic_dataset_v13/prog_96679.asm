; DESCRIPTION: Creates a yellow rectangular region at (307, 210) spanning 112 by 14 pixels.
; PLAN: r0=307(x), r1=210(y), r2=112(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 210
LDI r2, 112
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
