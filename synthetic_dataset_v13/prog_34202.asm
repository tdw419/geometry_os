; DESCRIPTION: Renders a red box of size 95x94 starting at (148, 124).
; PLAN: r0=148(x), r1=124(y), r2=95(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 124
LDI r2, 95
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
