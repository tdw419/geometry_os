; DESCRIPTION: Renders a white box of size 106x83 starting at (103, 19).
; PLAN: r0=103(x), r1=19(y), r2=106(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 19
LDI r2, 106
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
