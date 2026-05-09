; DESCRIPTION: Renders a green box of size 108x81 starting at (226, 171).
; PLAN: r0=226(x), r1=171(y), r2=108(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 171
LDI r2, 108
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
