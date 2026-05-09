; DESCRIPTION: Renders a red box of size 112x76 starting at (272, 33).
; PLAN: r0=272(x), r1=33(y), r2=112(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 33
LDI r2, 112
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
