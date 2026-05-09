; DESCRIPTION: Draws a cyan rectangle at (82, 164) with width 92 and height 68.
; PLAN: r0=82(x), r1=164(y), r2=92(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 164
LDI r2, 92
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
