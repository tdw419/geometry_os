; DESCRIPTION: Places a green 62x74 rectangle at position (369, 127).
; PLAN: r0=369(x), r1=127(y), r2=62(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 127
LDI r2, 62
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
