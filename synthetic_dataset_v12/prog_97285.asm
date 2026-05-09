; DESCRIPTION: Draws a cyan rectangle at (362, 93) with width 40 and height 49.
; PLAN: r0=362(x), r1=93(y), r2=40(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 93
LDI r2, 40
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
