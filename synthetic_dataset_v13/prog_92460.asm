; DESCRIPTION: Renders a red box of size 86x91 starting at (244, 140).
; PLAN: r0=244(x), r1=140(y), r2=86(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 140
LDI r2, 86
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
