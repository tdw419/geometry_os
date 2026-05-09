; DESCRIPTION: Draws a green rectangle at (294, 146) with width 30 and height 24.
; PLAN: r0=294(x), r1=146(y), r2=30(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 146
LDI r2, 30
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
