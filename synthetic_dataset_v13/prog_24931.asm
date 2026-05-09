; DESCRIPTION: Renders a yellow box of size 37x58 starting at (50, 197).
; PLAN: r0=50(x), r1=197(y), r2=37(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 197
LDI r2, 37
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
