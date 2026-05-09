; DESCRIPTION: Places a green 74x61 rectangle at position (132, 5).
; PLAN: r0=132(x), r1=5(y), r2=74(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 5
LDI r2, 74
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
