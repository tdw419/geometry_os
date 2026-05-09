; DESCRIPTION: Renders a white box of size 27x44 starting at (18, 114).
; PLAN: r0=18(x), r1=114(y), r2=27(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 114
LDI r2, 27
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
