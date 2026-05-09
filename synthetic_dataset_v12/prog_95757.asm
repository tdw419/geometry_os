; DESCRIPTION: Renders a yellow box of size 32x103 starting at (207, 140).
; PLAN: r0=207(x), r1=140(y), r2=32(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 140
LDI r2, 32
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
