; DESCRIPTION: Places a red 36x31 rectangle at position (327, 85).
; PLAN: r0=327(x), r1=85(y), r2=36(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 85
LDI r2, 36
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
