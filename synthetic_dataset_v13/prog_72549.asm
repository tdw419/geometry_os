; DESCRIPTION: Renders a yellow box of size 56x39 starting at (120, 211).
; PLAN: r0=120(x), r1=211(y), r2=56(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 211
LDI r2, 56
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
