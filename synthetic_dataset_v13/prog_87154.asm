; DESCRIPTION: Draws a yellow rectangle at (298, 169) with width 42 and height 64.
; PLAN: r0=298(x), r1=169(y), r2=42(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 169
LDI r2, 42
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
