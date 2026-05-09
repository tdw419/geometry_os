; DESCRIPTION: Creates a green rectangular region at (391, 40) spanning 117 by 111 pixels.
; PLAN: r0=391(x), r1=40(y), r2=117(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 40
LDI r2, 117
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
