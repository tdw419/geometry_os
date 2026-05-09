; DESCRIPTION: Places a red 24x77 rectangle at position (110, 51).
; PLAN: r0=110(x), r1=51(y), r2=24(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 51
LDI r2, 24
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
