; DESCRIPTION: Draws a cyan rectangle at (392, 218) with width 118 and height 27.
; PLAN: r0=392(x), r1=218(y), r2=118(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 218
LDI r2, 118
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
