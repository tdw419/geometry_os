; DESCRIPTION: Renders a red box of size 91x13 starting at (221, 40).
; PLAN: r0=221(x), r1=40(y), r2=91(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 40
LDI r2, 91
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
