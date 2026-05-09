; DESCRIPTION: Draws a cyan rectangle at (362, 127) with width 37 and height 50.
; PLAN: r0=362(x), r1=127(y), r2=37(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 127
LDI r2, 37
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
