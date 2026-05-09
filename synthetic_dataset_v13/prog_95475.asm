; DESCRIPTION: Places a cyan 25x16 rectangle at position (170, 14).
; PLAN: r0=170(x), r1=14(y), r2=25(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 14
LDI r2, 25
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
