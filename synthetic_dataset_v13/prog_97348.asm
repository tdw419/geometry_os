; DESCRIPTION: Draws a cyan rectangle at (36, 21) with width 60 and height 52.
; PLAN: r0=36(x), r1=21(y), r2=60(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 21
LDI r2, 60
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
