; DESCRIPTION: Draws a cyan rectangle at (463, 221) with width 49 and height 34.
; PLAN: r0=463(x), r1=221(y), r2=49(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 221
LDI r2, 49
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
