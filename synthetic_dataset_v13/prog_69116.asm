; DESCRIPTION: Draws a cyan rectangle at (186, 74) with width 76 and height 61.
; PLAN: r0=186(x), r1=74(y), r2=76(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 74
LDI r2, 76
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
