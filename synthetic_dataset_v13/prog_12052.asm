; DESCRIPTION: Places a white 40x94 rectangle at position (307, 89).
; PLAN: r0=307(x), r1=89(y), r2=40(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 89
LDI r2, 40
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
