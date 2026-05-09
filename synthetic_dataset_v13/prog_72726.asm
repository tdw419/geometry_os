; DESCRIPTION: Places a green 20x45 rectangle at position (486, 118).
; PLAN: r0=486(x), r1=118(y), r2=20(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 118
LDI r2, 20
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
