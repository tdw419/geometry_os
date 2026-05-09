; DESCRIPTION: Renders a white box of size 33x113 starting at (458, 95).
; PLAN: r0=458(x), r1=95(y), r2=33(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 95
LDI r2, 33
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
