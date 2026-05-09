; DESCRIPTION: Draws a cyan rectangle at (128, 127) with width 13 and height 93.
; PLAN: r0=128(x), r1=127(y), r2=13(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 127
LDI r2, 13
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
