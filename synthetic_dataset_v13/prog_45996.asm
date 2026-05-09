; DESCRIPTION: Places a cyan 25x14 rectangle at position (428, 142).
; PLAN: r0=428(x), r1=142(y), r2=25(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 142
LDI r2, 25
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
