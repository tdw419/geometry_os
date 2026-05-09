; DESCRIPTION: Renders a white box of size 27x40 starting at (12, 25).
; PLAN: r0=12(x), r1=25(y), r2=27(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 25
LDI r2, 27
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
