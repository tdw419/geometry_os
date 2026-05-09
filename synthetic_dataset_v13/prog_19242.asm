; DESCRIPTION: Renders a red box of size 112x79 starting at (213, 149).
; PLAN: r0=213(x), r1=149(y), r2=112(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 149
LDI r2, 112
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
