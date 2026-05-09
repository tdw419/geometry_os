; DESCRIPTION: Places a yellow 87x117 rectangle at position (144, 127).
; PLAN: r0=144(x), r1=127(y), r2=87(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 127
LDI r2, 87
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
