; DESCRIPTION: Renders a green box of size 51x70 starting at (440, 6).
; PLAN: r0=440(x), r1=6(y), r2=51(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 6
LDI r2, 51
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
