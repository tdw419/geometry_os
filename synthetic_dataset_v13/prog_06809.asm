; DESCRIPTION: Renders a white box of size 57x27 starting at (449, 8).
; PLAN: r0=449(x), r1=8(y), r2=57(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 8
LDI r2, 57
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
