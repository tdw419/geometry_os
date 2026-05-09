; DESCRIPTION: Places a cyan 20x69 rectangle at position (471, 39).
; PLAN: r0=471(x), r1=39(y), r2=20(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 39
LDI r2, 20
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
