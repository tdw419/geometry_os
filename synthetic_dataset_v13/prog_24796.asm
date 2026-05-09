; DESCRIPTION: Draws a cyan rectangle at (221, 131) with width 75 and height 98.
; PLAN: r0=221(x), r1=131(y), r2=75(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 131
LDI r2, 75
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
