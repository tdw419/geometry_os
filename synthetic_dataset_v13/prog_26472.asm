; DESCRIPTION: Creates a yellow rectangular region at (52, 126) spanning 25 by 111 pixels.
; PLAN: r0=52(x), r1=126(y), r2=25(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 126
LDI r2, 25
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
