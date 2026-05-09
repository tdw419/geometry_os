; DESCRIPTION: Draws a cyan rectangle at (52, 129) with width 14 and height 40.
; PLAN: r0=52(x), r1=129(y), r2=14(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 129
LDI r2, 14
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
