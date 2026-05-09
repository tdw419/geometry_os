; DESCRIPTION: Renders a yellow box of size 31x58 starting at (146, 0).
; PLAN: r0=146(x), r1=0(y), r2=31(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 0
LDI r2, 31
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
