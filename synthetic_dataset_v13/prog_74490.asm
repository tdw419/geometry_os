; DESCRIPTION: Renders a yellow box of size 117x77 starting at (16, 34).
; PLAN: r0=16(x), r1=34(y), r2=117(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 34
LDI r2, 117
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
