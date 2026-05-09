; DESCRIPTION: Renders a red box of size 106x51 starting at (206, 150).
; PLAN: r0=206(x), r1=150(y), r2=106(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 150
LDI r2, 106
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
