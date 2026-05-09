; DESCRIPTION: Draws a cyan rectangle at (298, 125) with width 49 and height 24.
; PLAN: r0=298(x), r1=125(y), r2=49(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 125
LDI r2, 49
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
