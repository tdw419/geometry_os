; DESCRIPTION: Renders a green box of size 71x117 starting at (437, 35).
; PLAN: r0=437(x), r1=35(y), r2=71(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 35
LDI r2, 71
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
