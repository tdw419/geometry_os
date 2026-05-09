; DESCRIPTION: Renders a red box of size 79x44 starting at (145, 141).
; PLAN: r0=145(x), r1=141(y), r2=79(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 141
LDI r2, 79
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
