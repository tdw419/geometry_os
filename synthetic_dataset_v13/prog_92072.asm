; DESCRIPTION: Renders a red box of size 99x109 starting at (367, 49).
; PLAN: r0=367(x), r1=49(y), r2=99(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 49
LDI r2, 99
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
