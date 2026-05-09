; DESCRIPTION: Places a cyan 75x58 rectangle at position (413, 51).
; PLAN: r0=413(x), r1=51(y), r2=75(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 51
LDI r2, 75
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
