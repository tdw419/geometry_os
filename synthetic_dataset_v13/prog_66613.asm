; DESCRIPTION: Places a green 51x26 rectangle at position (383, 38).
; PLAN: r0=383(x), r1=38(y), r2=51(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 38
LDI r2, 51
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
