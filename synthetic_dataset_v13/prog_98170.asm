; DESCRIPTION: Places a yellow 87x61 rectangle at position (423, 190).
; PLAN: r0=423(x), r1=190(y), r2=87(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 190
LDI r2, 87
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
