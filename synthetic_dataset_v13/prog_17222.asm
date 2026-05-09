; DESCRIPTION: Places a cyan 20x35 rectangle at position (130, 23).
; PLAN: r0=130(x), r1=23(y), r2=20(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 23
LDI r2, 20
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
