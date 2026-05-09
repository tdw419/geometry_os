; DESCRIPTION: Renders a yellow box of size 13x103 starting at (57, 142).
; PLAN: r0=57(x), r1=142(y), r2=13(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 142
LDI r2, 13
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
