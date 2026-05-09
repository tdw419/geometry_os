; DESCRIPTION: Places a green 72x118 rectangle at position (241, 27).
; PLAN: r0=241(x), r1=27(y), r2=72(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 27
LDI r2, 72
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
