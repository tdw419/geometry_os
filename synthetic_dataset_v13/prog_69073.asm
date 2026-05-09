; DESCRIPTION: Draws a cyan rectangle at (333, 214) with width 23 and height 23.
; PLAN: r0=333(x), r1=214(y), r2=23(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 214
LDI r2, 23
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
