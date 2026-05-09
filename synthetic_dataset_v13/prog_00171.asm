; DESCRIPTION: Renders a white box of size 73x73 starting at (374, 129).
; PLAN: r0=374(x), r1=129(y), r2=73(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 129
LDI r2, 73
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
