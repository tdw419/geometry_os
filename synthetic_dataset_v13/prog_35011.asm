; DESCRIPTION: Renders a yellow box of size 94x43 starting at (117, 42).
; PLAN: r0=117(x), r1=42(y), r2=94(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 42
LDI r2, 94
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
