; DESCRIPTION: Places a red 18x98 rectangle at position (131, 112).
; PLAN: r0=131(x), r1=112(y), r2=18(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 112
LDI r2, 18
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
