; DESCRIPTION: Places a green 98x61 rectangle at position (185, 3).
; PLAN: r0=185(x), r1=3(y), r2=98(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 3
LDI r2, 98
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
