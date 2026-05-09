; DESCRIPTION: Draws a cyan rectangle at (92, 76) with width 68 and height 42.
; PLAN: r0=92(x), r1=76(y), r2=68(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 76
LDI r2, 68
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
