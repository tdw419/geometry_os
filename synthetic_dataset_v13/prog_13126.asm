; DESCRIPTION: Renders a green box of size 62x113 starting at (317, 58).
; PLAN: r0=317(x), r1=58(y), r2=62(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 58
LDI r2, 62
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
