; DESCRIPTION: Draws a white rectangle at (242, 63) with width 94 and height 82.
; PLAN: r0=242(x), r1=63(y), r2=94(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 63
LDI r2, 94
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
