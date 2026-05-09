; DESCRIPTION: Places a blue 25x40 rectangle at position (290, 21).
; PLAN: r0=290(x), r1=21(y), r2=25(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 21
LDI r2, 25
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
