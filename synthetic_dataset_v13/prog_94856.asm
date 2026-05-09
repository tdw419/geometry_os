; DESCRIPTION: Places a red 89x50 rectangle at position (327, 129).
; PLAN: r0=327(x), r1=129(y), r2=89(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 129
LDI r2, 89
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
