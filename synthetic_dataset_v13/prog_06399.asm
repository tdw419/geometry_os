; DESCRIPTION: Draws a cyan rectangle at (221, 74) with width 95 and height 50.
; PLAN: r0=221(x), r1=74(y), r2=95(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 74
LDI r2, 95
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
