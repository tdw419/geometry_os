; DESCRIPTION: Draws a cyan rectangle at (290, 181) with width 11 and height 48.
; PLAN: r0=290(x), r1=181(y), r2=11(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 181
LDI r2, 11
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
