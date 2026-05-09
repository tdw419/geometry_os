; DESCRIPTION: Draws a cyan rectangle at (275, 2) with width 72 and height 100.
; PLAN: r0=275(x), r1=2(y), r2=72(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 2
LDI r2, 72
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
