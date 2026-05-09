; DESCRIPTION: Renders a white box of size 15x27 starting at (458, 70).
; PLAN: r0=458(x), r1=70(y), r2=15(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 70
LDI r2, 15
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
