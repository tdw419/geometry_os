; DESCRIPTION: Draws a white rectangle at (242, 192) with width 12 and height 37.
; PLAN: r0=242(x), r1=192(y), r2=12(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 192
LDI r2, 12
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
