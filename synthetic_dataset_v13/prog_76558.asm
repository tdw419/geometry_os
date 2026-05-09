; DESCRIPTION: Places a cyan 81x107 rectangle at position (401, 47).
; PLAN: r0=401(x), r1=47(y), r2=81(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 47
LDI r2, 81
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
