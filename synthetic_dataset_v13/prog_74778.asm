; DESCRIPTION: Places a yellow 38x63 rectangle at position (265, 123).
; PLAN: r0=265(x), r1=123(y), r2=38(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 123
LDI r2, 38
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
