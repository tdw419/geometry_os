; DESCRIPTION: Places a green 27x81 rectangle at position (144, 175).
; PLAN: r0=144(x), r1=175(y), r2=27(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 175
LDI r2, 27
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
