; DESCRIPTION: Places a red 16x36 rectangle at position (471, 171).
; PLAN: r0=471(x), r1=171(y), r2=16(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 171
LDI r2, 16
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
