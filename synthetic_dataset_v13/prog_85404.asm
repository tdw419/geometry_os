; DESCRIPTION: Places a green 47x117 rectangle at position (106, 2).
; PLAN: r0=106(x), r1=2(y), r2=47(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 2
LDI r2, 47
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
