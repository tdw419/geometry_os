; DESCRIPTION: Renders a green box of size 65x49 starting at (207, 153).
; PLAN: r0=207(x), r1=153(y), r2=65(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 153
LDI r2, 65
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
