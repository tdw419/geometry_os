; DESCRIPTION: Draws a cyan rectangle at (323, 180) with width 47 and height 40.
; PLAN: r0=323(x), r1=180(y), r2=47(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 180
LDI r2, 47
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
