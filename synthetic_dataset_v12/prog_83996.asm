; DESCRIPTION: Renders a yellow box of size 52x96 starting at (281, 59).
; PLAN: r0=281(x), r1=59(y), r2=52(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 59
LDI r2, 52
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
