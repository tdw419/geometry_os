; DESCRIPTION: Places a cyan 92x23 rectangle at position (311, 194).
; PLAN: r0=311(x), r1=194(y), r2=92(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 194
LDI r2, 92
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
