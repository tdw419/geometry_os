; DESCRIPTION: Places a green 117x45 rectangle at position (87, 74).
; PLAN: r0=87(x), r1=74(y), r2=117(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 74
LDI r2, 117
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
