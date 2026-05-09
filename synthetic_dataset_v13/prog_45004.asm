; DESCRIPTION: Places a yellow 13x10 rectangle at position (150, 64).
; PLAN: r0=150(x), r1=64(y), r2=13(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 64
LDI r2, 13
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
