; DESCRIPTION: Renders a white box of size 66x111 starting at (300, 25).
; PLAN: r0=300(x), r1=25(y), r2=66(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 25
LDI r2, 66
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
