; DESCRIPTION: Draws a cyan rectangle at (92, 57) with width 22 and height 79.
; PLAN: r0=92(x), r1=57(y), r2=22(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 57
LDI r2, 22
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
