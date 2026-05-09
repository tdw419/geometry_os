; DESCRIPTION: Renders a red box of size 51x91 starting at (240, 119).
; PLAN: r0=240(x), r1=119(y), r2=51(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 119
LDI r2, 51
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
