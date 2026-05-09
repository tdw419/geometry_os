; DESCRIPTION: Renders a green box of size 103x11 starting at (153, 141).
; PLAN: r0=153(x), r1=141(y), r2=103(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 141
LDI r2, 103
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
