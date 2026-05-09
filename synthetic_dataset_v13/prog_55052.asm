; DESCRIPTION: Draws a cyan rectangle at (419, 109) with width 56 and height 93.
; PLAN: r0=419(x), r1=109(y), r2=56(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 109
LDI r2, 56
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
