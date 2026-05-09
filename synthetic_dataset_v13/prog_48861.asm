; DESCRIPTION: Renders a red box of size 117x33 starting at (124, 13).
; PLAN: r0=124(x), r1=13(y), r2=117(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 13
LDI r2, 117
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
