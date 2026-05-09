; DESCRIPTION: Places a green 81x54 rectangle at position (426, 186).
; PLAN: r0=426(x), r1=186(y), r2=81(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 186
LDI r2, 81
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
