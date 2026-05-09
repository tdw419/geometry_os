; DESCRIPTION: Places a green 106x32 rectangle at position (9, 160).
; PLAN: r0=9(x), r1=160(y), r2=106(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 160
LDI r2, 106
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
