; DESCRIPTION: Draws a red rectangle at (242, 32) with width 52 and height 79.
; PLAN: r0=242(x), r1=32(y), r2=52(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 32
LDI r2, 52
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
