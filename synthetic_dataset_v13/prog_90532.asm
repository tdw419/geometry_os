; DESCRIPTION: Draws a cyan rectangle at (138, 107) with width 25 and height 82.
; PLAN: r0=138(x), r1=107(y), r2=25(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 107
LDI r2, 25
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
