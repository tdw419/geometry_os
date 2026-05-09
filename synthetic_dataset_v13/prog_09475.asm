; DESCRIPTION: Renders a red box of size 106x91 starting at (211, 115).
; PLAN: r0=211(x), r1=115(y), r2=106(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 115
LDI r2, 106
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
