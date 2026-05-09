; DESCRIPTION: Draws a cyan rectangle at (340, 81) with width 111 and height 51.
; PLAN: r0=340(x), r1=81(y), r2=111(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 81
LDI r2, 111
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
