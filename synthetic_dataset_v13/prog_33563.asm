; DESCRIPTION: Renders a yellow box of size 91x47 starting at (211, 207).
; PLAN: r0=211(x), r1=207(y), r2=91(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 207
LDI r2, 91
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
