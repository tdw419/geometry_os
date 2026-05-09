; DESCRIPTION: Renders a yellow box of size 21x58 starting at (28, 178).
; PLAN: r0=28(x), r1=178(y), r2=21(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 178
LDI r2, 21
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
