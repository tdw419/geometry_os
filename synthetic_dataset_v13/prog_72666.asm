; DESCRIPTION: Draws a cyan rectangle at (352, 82) with width 65 and height 97.
; PLAN: r0=352(x), r1=82(y), r2=65(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 82
LDI r2, 65
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
