; DESCRIPTION: Places a yellow 54x63 rectangle at position (140, 103).
; PLAN: r0=140(x), r1=103(y), r2=54(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 103
LDI r2, 54
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
