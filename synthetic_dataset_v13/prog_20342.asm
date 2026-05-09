; DESCRIPTION: Renders a white box of size 95x111 starting at (393, 122).
; PLAN: r0=393(x), r1=122(y), r2=95(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 122
LDI r2, 95
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
