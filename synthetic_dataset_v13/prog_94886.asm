; DESCRIPTION: Draws a cyan rectangle at (154, 21) with width 60 and height 51.
; PLAN: r0=154(x), r1=21(y), r2=60(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 21
LDI r2, 60
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
