; DESCRIPTION: Renders a red box of size 51x116 starting at (400, 74).
; PLAN: r0=400(x), r1=74(y), r2=51(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 74
LDI r2, 51
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
