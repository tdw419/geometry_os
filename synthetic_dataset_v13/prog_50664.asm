; DESCRIPTION: Places a black 56x63 rectangle at position (48, 163).
; PLAN: r0=48(x), r1=163(y), r2=56(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 163
LDI r2, 56
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
