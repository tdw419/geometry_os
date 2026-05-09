; DESCRIPTION: Renders a green box of size 93x102 starting at (324, 153).
; PLAN: r0=324(x), r1=153(y), r2=93(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 153
LDI r2, 93
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
