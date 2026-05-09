; DESCRIPTION: Draws a cyan rectangle at (9, 58) with width 109 and height 72.
; PLAN: r0=9(x), r1=58(y), r2=109(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 58
LDI r2, 109
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
