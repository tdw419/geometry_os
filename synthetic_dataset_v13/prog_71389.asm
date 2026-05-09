; DESCRIPTION: Renders a yellow box of size 77x16 starting at (420, 207).
; PLAN: r0=420(x), r1=207(y), r2=77(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 207
LDI r2, 77
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
