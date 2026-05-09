; DESCRIPTION: Places a yellow 99x63 rectangle at position (52, 42).
; PLAN: r0=52(x), r1=42(y), r2=99(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 42
LDI r2, 99
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
