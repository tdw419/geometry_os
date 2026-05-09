; DESCRIPTION: Places a green 81x75 rectangle at position (373, 27).
; PLAN: r0=373(x), r1=27(y), r2=81(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 27
LDI r2, 81
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
