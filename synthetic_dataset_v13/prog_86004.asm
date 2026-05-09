; DESCRIPTION: Draws a cyan rectangle at (304, 34) with width 119 and height 61.
; PLAN: r0=304(x), r1=34(y), r2=119(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 34
LDI r2, 119
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
