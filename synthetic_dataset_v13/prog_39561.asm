; DESCRIPTION: Draws a cyan rectangle at (335, 16) with width 68 and height 61.
; PLAN: r0=335(x), r1=16(y), r2=68(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 16
LDI r2, 68
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
