; DESCRIPTION: Renders a red box of size 76x109 starting at (431, 107).
; PLAN: r0=431(x), r1=107(y), r2=76(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 107
LDI r2, 76
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
