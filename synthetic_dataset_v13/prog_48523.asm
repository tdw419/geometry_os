; DESCRIPTION: Renders a yellow box of size 39x86 starting at (34, 162).
; PLAN: r0=34(x), r1=162(y), r2=39(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 162
LDI r2, 39
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
