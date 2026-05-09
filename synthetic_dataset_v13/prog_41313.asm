; DESCRIPTION: Renders a white box of size 40x27 starting at (64, 141).
; PLAN: r0=64(x), r1=141(y), r2=40(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 141
LDI r2, 40
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
