; DESCRIPTION: Creates a red rectangular region at (136, 32) spanning 111 by 102 pixels.
; PLAN: r0=136(x), r1=32(y), r2=111(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 32
LDI r2, 111
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
