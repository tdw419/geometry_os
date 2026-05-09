; DESCRIPTION: Renders a green box of size 93x72 starting at (326, 121).
; PLAN: r0=326(x), r1=121(y), r2=93(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 121
LDI r2, 93
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
