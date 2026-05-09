; DESCRIPTION: Renders a white box of size 112x82 starting at (71, 48).
; PLAN: r0=71(x), r1=48(y), r2=112(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 48
LDI r2, 112
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
