; DESCRIPTION: Renders a yellow box of size 118x77 starting at (329, 174).
; PLAN: r0=329(x), r1=174(y), r2=118(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 174
LDI r2, 118
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
