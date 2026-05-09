; DESCRIPTION: Places a yellow 83x63 rectangle at position (75, 53).
; PLAN: r0=75(x), r1=53(y), r2=83(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 53
LDI r2, 83
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
