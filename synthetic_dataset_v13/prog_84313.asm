; DESCRIPTION: Places a cyan 38x25 rectangle at position (104, 23).
; PLAN: r0=104(x), r1=23(y), r2=38(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 23
LDI r2, 38
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
