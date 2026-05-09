; DESCRIPTION: Draws a green rectangle at (242, 176) with width 21 and height 50.
; PLAN: r0=242(x), r1=176(y), r2=21(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 176
LDI r2, 21
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
