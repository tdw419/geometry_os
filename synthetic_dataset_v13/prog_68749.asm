; DESCRIPTION: Renders a white box of size 70x29 starting at (174, 182).
; PLAN: r0=174(x), r1=182(y), r2=70(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 182
LDI r2, 70
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
