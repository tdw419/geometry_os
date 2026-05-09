; DESCRIPTION: Places a red 48x51 rectangle at position (248, 52).
; PLAN: r0=248(x), r1=52(y), r2=48(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 52
LDI r2, 48
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
