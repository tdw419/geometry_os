; DESCRIPTION: Places a white 86x110 rectangle at position (161, 126).
; PLAN: r0=161(x), r1=126(y), r2=86(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 126
LDI r2, 86
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
