; DESCRIPTION: Renders a white box of size 120x73 starting at (347, 28).
; PLAN: r0=347(x), r1=28(y), r2=120(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 28
LDI r2, 120
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
