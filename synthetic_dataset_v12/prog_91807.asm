; DESCRIPTION: Draws a cyan rectangle at (172, 187) with width 100 and height 27.
; PLAN: r0=172(x), r1=187(y), r2=100(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 187
LDI r2, 100
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
