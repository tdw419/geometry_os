; DESCRIPTION: Places a green 25x40 rectangle at position (208, 48).
; PLAN: r0=208(x), r1=48(y), r2=25(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 48
LDI r2, 25
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
