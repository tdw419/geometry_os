; DESCRIPTION: Draws a cyan rectangle at (193, 21) with width 46 and height 27.
; PLAN: r0=193(x), r1=21(y), r2=46(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 21
LDI r2, 46
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
