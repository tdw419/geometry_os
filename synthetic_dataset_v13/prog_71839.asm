; DESCRIPTION: Renders a yellow box of size 28x77 starting at (33, 90).
; PLAN: r0=33(x), r1=90(y), r2=28(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 90
LDI r2, 28
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
