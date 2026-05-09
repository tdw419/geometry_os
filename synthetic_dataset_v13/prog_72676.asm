; DESCRIPTION: Renders a green box of size 51x20 starting at (252, 143).
; PLAN: r0=252(x), r1=143(y), r2=51(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 143
LDI r2, 51
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
