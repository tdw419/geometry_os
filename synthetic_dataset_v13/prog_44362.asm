; DESCRIPTION: Draws a red rectangle at (374, 16) with width 68 and height 18.
; PLAN: r0=374(x), r1=16(y), r2=68(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 16
LDI r2, 68
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
