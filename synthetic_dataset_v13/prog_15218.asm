; DESCRIPTION: Places a cyan 89x94 rectangle at position (300, 103).
; PLAN: r0=300(x), r1=103(y), r2=89(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 103
LDI r2, 89
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
