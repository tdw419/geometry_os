; DESCRIPTION: Draws a red rectangle at (340, 65) with width 48 and height 57.
; PLAN: r0=340(x), r1=65(y), r2=48(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 65
LDI r2, 48
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
