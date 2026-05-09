; DESCRIPTION: Draws a cyan rectangle at (23, 47) with width 14 and height 13.
; PLAN: r0=23(x), r1=47(y), r2=14(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 47
LDI r2, 14
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
