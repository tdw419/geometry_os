; DESCRIPTION: Draws a cyan rectangle at (498, 146) with width 10 and height 92.
; PLAN: r0=498(x), r1=146(y), r2=10(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 146
LDI r2, 10
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
