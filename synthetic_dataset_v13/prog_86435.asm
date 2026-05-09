; DESCRIPTION: Renders a red box of size 37x23 starting at (44, 68).
; PLAN: r0=44(x), r1=68(y), r2=37(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 68
LDI r2, 37
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
