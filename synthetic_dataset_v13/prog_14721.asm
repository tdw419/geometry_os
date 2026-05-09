; DESCRIPTION: Renders a white box of size 102x82 starting at (160, 165).
; PLAN: r0=160(x), r1=165(y), r2=102(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 165
LDI r2, 102
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
