; DESCRIPTION: Creates a purple rectangular region at (27, 94) spanning 111 by 25 pixels.
; PLAN: r0=27(x), r1=94(y), r2=111(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 94
LDI r2, 111
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
