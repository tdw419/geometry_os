; DESCRIPTION: Renders a red box of size 117x48 starting at (174, 11).
; PLAN: r0=174(x), r1=11(y), r2=117(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 11
LDI r2, 117
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
