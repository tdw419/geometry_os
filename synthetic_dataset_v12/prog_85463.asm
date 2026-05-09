; DESCRIPTION: Places a yellow 63x112 rectangle at position (389, 21).
; PLAN: r0=389(x), r1=21(y), r2=63(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 21
LDI r2, 63
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
