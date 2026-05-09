; DESCRIPTION: Places a yellow 24x28 rectangle at position (449, 217).
; PLAN: r0=449(x), r1=217(y), r2=24(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 217
LDI r2, 24
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
