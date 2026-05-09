; DESCRIPTION: Renders a green box of size 71x68 starting at (288, 182).
; PLAN: r0=288(x), r1=182(y), r2=71(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 182
LDI r2, 71
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
