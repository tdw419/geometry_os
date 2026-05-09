; DESCRIPTION: Renders a white box of size 73x27 starting at (132, 134).
; PLAN: r0=132(x), r1=134(y), r2=73(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 134
LDI r2, 73
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
