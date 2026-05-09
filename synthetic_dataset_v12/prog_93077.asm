; DESCRIPTION: Draws a yellow rectangle at (272, 94) with width 86 and height 117.
; PLAN: r0=272(x), r1=94(y), r2=86(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 94
LDI r2, 86
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
