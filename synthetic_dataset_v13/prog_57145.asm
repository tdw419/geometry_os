; DESCRIPTION: Draws a yellow rectangle at (255, 182) with width 12 and height 70.
; PLAN: r0=255(x), r1=182(y), r2=12(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 182
LDI r2, 12
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
