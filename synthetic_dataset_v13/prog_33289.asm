; DESCRIPTION: Places a green 89x39 rectangle at position (263, 131).
; PLAN: r0=263(x), r1=131(y), r2=89(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 131
LDI r2, 89
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
