; DESCRIPTION: Draws a cyan rectangle at (92, 25) with width 97 and height 64.
; PLAN: r0=92(x), r1=25(y), r2=97(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 25
LDI r2, 97
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
