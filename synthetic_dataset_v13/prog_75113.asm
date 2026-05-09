; DESCRIPTION: Renders a yellow box of size 19x117 starting at (394, 87).
; PLAN: r0=394(x), r1=87(y), r2=19(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 87
LDI r2, 19
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
