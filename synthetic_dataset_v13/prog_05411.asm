; DESCRIPTION: Places a green 25x90 rectangle at position (44, 136).
; PLAN: r0=44(x), r1=136(y), r2=25(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 136
LDI r2, 25
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
