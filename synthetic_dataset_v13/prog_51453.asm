; DESCRIPTION: Places a white 25x75 rectangle at position (387, 89).
; PLAN: r0=387(x), r1=89(y), r2=25(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 89
LDI r2, 25
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
