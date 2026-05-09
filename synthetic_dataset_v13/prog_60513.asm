; DESCRIPTION: Renders a red box of size 106x55 starting at (55, 152).
; PLAN: r0=55(x), r1=152(y), r2=106(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 152
LDI r2, 106
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
