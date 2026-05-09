; DESCRIPTION: Renders a red box of size 77x110 starting at (330, 146).
; PLAN: r0=330(x), r1=146(y), r2=77(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 146
LDI r2, 77
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
