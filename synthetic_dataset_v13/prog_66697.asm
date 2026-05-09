; DESCRIPTION: Places a green 74x54 rectangle at position (51, 170).
; PLAN: r0=51(x), r1=170(y), r2=74(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 170
LDI r2, 74
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
