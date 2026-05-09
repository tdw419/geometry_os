; DESCRIPTION: Renders a green box of size 117x51 starting at (210, 85).
; PLAN: r0=210(x), r1=85(y), r2=117(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 85
LDI r2, 117
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
