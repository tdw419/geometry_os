; DESCRIPTION: Renders a yellow box of size 120x37 starting at (120, 172).
; PLAN: r0=120(x), r1=172(y), r2=120(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 172
LDI r2, 120
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
