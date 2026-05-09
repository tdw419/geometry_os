; DESCRIPTION: Renders a white box of size 25x82 starting at (233, 152).
; PLAN: r0=233(x), r1=152(y), r2=25(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 152
LDI r2, 25
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
