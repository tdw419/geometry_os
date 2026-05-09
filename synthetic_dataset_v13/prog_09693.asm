; DESCRIPTION: Places a cyan 93x51 rectangle at position (60, 1).
; PLAN: r0=60(x), r1=1(y), r2=93(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 1
LDI r2, 93
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
