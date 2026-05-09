; DESCRIPTION: Renders a red box of size 110x22 starting at (187, 120).
; PLAN: r0=187(x), r1=120(y), r2=110(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 120
LDI r2, 110
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
