; DESCRIPTION: Renders a yellow box of size 107x35 starting at (331, 200).
; PLAN: r0=331(x), r1=200(y), r2=107(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 200
LDI r2, 107
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
