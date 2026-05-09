; DESCRIPTION: Draws a green rectangle at (23, 221) with width 94 and height 32.
; PLAN: r0=23(x), r1=221(y), r2=94(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 221
LDI r2, 94
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
