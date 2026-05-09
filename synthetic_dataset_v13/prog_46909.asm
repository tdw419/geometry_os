; DESCRIPTION: Renders a red box of size 51x10 starting at (229, 196).
; PLAN: r0=229(x), r1=196(y), r2=51(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 196
LDI r2, 51
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
