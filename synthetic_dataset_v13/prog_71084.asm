; DESCRIPTION: Places a yellow 63x28 rectangle at position (10, 124).
; PLAN: r0=10(x), r1=124(y), r2=63(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 124
LDI r2, 63
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
