; DESCRIPTION: Places a green 11x74 rectangle at position (391, 170).
; PLAN: r0=391(x), r1=170(y), r2=11(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 170
LDI r2, 11
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
