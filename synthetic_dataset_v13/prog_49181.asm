; DESCRIPTION: Renders a red box of size 96x106 starting at (186, 79).
; PLAN: r0=186(x), r1=79(y), r2=96(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 79
LDI r2, 96
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
