; DESCRIPTION: Places a white 110x68 rectangle at position (220, 163).
; PLAN: r0=220(x), r1=163(y), r2=110(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 163
LDI r2, 110
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
