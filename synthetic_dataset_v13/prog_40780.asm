; DESCRIPTION: Renders a yellow box of size 31x21 starting at (271, 188).
; PLAN: r0=271(x), r1=188(y), r2=31(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 188
LDI r2, 31
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
