; DESCRIPTION: Renders a red box of size 51x13 starting at (280, 195).
; PLAN: r0=280(x), r1=195(y), r2=51(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 195
LDI r2, 51
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
