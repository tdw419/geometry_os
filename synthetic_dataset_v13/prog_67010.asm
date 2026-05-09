; DESCRIPTION: Renders a white box of size 113x33 starting at (123, 40).
; PLAN: r0=123(x), r1=40(y), r2=113(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 40
LDI r2, 113
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
