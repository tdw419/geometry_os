; DESCRIPTION: Places a black 13x90 rectangle at position (63, 33).
; PLAN: r0=63(x), r1=33(y), r2=13(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 33
LDI r2, 13
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
