; DESCRIPTION: Places a black 34x63 rectangle at position (464, 20).
; PLAN: r0=464(x), r1=20(y), r2=34(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 20
LDI r2, 34
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
