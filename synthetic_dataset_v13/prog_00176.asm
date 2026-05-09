; DESCRIPTION: Renders a green box of size 70x120 starting at (169, 0).
; PLAN: r0=169(x), r1=0(y), r2=70(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 0
LDI r2, 70
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
