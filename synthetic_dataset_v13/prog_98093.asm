; DESCRIPTION: Places a yellow 75x40 rectangle at position (420, 74).
; PLAN: r0=420(x), r1=74(y), r2=75(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 74
LDI r2, 75
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
