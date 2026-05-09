; DESCRIPTION: Renders a white box of size 12x111 starting at (98, 0).
; PLAN: r0=98(x), r1=0(y), r2=12(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 0
LDI r2, 12
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
