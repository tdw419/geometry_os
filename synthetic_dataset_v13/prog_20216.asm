; DESCRIPTION: Renders a white box of size 90x117 starting at (317, 64).
; PLAN: r0=317(x), r1=64(y), r2=90(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 64
LDI r2, 90
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
