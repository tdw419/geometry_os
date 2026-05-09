; DESCRIPTION: Draws a yellow rectangle at (417, 149) with width 50 and height 27.
; PLAN: r0=417(x), r1=149(y), r2=50(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 149
LDI r2, 50
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
