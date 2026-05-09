; DESCRIPTION: Draws a cyan rectangle at (386, 125) with width 10 and height 94.
; PLAN: r0=386(x), r1=125(y), r2=10(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 125
LDI r2, 10
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
