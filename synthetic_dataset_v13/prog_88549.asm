; DESCRIPTION: Places a cyan 25x45 rectangle at position (389, 129).
; PLAN: r0=389(x), r1=129(y), r2=25(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 129
LDI r2, 25
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
