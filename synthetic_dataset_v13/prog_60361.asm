; DESCRIPTION: Places a red 17x101 rectangle at position (213, 86).
; PLAN: r0=213(x), r1=86(y), r2=17(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 86
LDI r2, 17
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
