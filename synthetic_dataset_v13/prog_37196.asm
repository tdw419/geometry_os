; DESCRIPTION: Places a cyan 60x60 rectangle at position (162, 20).
; PLAN: r0=162(x), r1=20(y), r2=60(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 20
LDI r2, 60
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
