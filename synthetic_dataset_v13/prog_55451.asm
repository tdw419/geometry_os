; DESCRIPTION: Renders a yellow box of size 66x80 starting at (294, 104).
; PLAN: r0=294(x), r1=104(y), r2=66(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 104
LDI r2, 66
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
