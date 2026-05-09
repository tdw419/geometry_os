; DESCRIPTION: Draws a cyan rectangle at (297, 31) with width 12 and height 59.
; PLAN: r0=297(x), r1=31(y), r2=12(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 31
LDI r2, 12
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
