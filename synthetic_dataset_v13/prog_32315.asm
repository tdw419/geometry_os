; DESCRIPTION: Places a yellow 10x13 rectangle at position (43, 57).
; PLAN: r0=43(x), r1=57(y), r2=10(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 57
LDI r2, 10
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
