; DESCRIPTION: Places a green 22x50 rectangle at position (486, 205).
; PLAN: r0=486(x), r1=205(y), r2=22(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 205
LDI r2, 22
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
