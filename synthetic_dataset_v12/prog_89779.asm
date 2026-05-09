; DESCRIPTION: Places a green 104x101 rectangle at position (81, 29).
; PLAN: r0=81(x), r1=29(y), r2=104(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 29
LDI r2, 104
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
