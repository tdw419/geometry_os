; DESCRIPTION: Renders a white box of size 27x30 starting at (109, 195).
; PLAN: r0=109(x), r1=195(y), r2=27(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 195
LDI r2, 27
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
