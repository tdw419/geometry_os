; DESCRIPTION: Places a orange 38x94 rectangle at position (141, 112).
; PLAN: r0=141(x), r1=112(y), r2=38(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 112
LDI r2, 38
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
