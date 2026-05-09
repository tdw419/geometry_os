; DESCRIPTION: Places a green 110x31 rectangle at position (401, 131).
; PLAN: r0=401(x), r1=131(y), r2=110(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 131
LDI r2, 110
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
