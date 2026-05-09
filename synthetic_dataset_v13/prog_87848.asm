; DESCRIPTION: Draws a green rectangle at (394, 80) with width 95 and height 21.
; PLAN: r0=394(x), r1=80(y), r2=95(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 80
LDI r2, 95
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
