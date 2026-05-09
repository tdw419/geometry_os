; DESCRIPTION: Places a cyan 87x93 rectangle at position (405, 51).
; PLAN: r0=405(x), r1=51(y), r2=87(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 51
LDI r2, 87
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
