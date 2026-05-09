; DESCRIPTION: Draws a white rectangle at (391, 82) with width 111 and height 99.
; PLAN: r0=391(x), r1=82(y), r2=111(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 82
LDI r2, 111
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
