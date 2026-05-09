; DESCRIPTION: Renders a yellow box of size 39x77 starting at (457, 103).
; PLAN: r0=457(x), r1=103(y), r2=39(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 103
LDI r2, 39
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
