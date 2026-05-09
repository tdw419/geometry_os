; DESCRIPTION: Draws a cyan rectangle at (16, 58) with width 103 and height 51.
; PLAN: r0=16(x), r1=58(y), r2=103(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 58
LDI r2, 103
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
