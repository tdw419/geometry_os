; DESCRIPTION: Renders a red box of size 68x109 starting at (412, 99).
; PLAN: r0=412(x), r1=99(y), r2=68(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 99
LDI r2, 68
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
