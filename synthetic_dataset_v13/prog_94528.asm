; DESCRIPTION: Draws a red rectangle at (307, 8) with width 91 and height 48.
; PLAN: r0=307(x), r1=8(y), r2=91(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 8
LDI r2, 91
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
