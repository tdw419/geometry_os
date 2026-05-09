; DESCRIPTION: Draws a yellow rectangle at (193, 103) with width 44 and height 32.
; PLAN: r0=193(x), r1=103(y), r2=44(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 103
LDI r2, 44
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
