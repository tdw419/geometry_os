; DESCRIPTION: Draws a green rectangle at (298, 126) with width 16 and height 120.
; PLAN: r0=298(x), r1=126(y), r2=16(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 126
LDI r2, 16
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
