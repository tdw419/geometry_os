; DESCRIPTION: Draws a cyan rectangle at (123, 236) with width 22 and height 19.
; PLAN: r0=123(x), r1=236(y), r2=22(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 236
LDI r2, 22
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
