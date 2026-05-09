; DESCRIPTION: Renders a red box of size 91x117 starting at (340, 26).
; PLAN: r0=340(x), r1=26(y), r2=91(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 26
LDI r2, 91
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
