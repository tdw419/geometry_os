; DESCRIPTION: Places a green 57x104 rectangle at position (168, 129).
; PLAN: r0=168(x), r1=129(y), r2=57(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 129
LDI r2, 57
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
