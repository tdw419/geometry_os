; DESCRIPTION: Creates a green rectangular region at (265, 111) spanning 103 by 58 pixels.
; PLAN: r0=265(x), r1=111(y), r2=103(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 111
LDI r2, 103
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
