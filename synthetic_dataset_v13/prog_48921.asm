; DESCRIPTION: Renders a white box of size 55x82 starting at (428, 123).
; PLAN: r0=428(x), r1=123(y), r2=55(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 123
LDI r2, 55
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
