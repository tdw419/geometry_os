; DESCRIPTION: Places a green 104x57 rectangle at position (194, 86).
; PLAN: r0=194(x), r1=86(y), r2=104(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 86
LDI r2, 104
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
