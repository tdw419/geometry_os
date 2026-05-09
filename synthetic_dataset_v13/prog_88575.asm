; DESCRIPTION: Places a blue 120x63 rectangle at position (61, 7).
; PLAN: r0=61(x), r1=7(y), r2=120(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 7
LDI r2, 120
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
