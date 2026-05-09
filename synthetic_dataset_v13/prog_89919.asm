; DESCRIPTION: Renders a yellow box of size 85x32 starting at (290, 181).
; PLAN: r0=290(x), r1=181(y), r2=85(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 181
LDI r2, 85
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
