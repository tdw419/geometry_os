; DESCRIPTION: Places a cyan 44x51 rectangle at position (365, 140).
; PLAN: r0=365(x), r1=140(y), r2=44(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 140
LDI r2, 44
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
