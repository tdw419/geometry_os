; DESCRIPTION: Places a green 25x65 rectangle at position (285, 94).
; PLAN: r0=285(x), r1=94(y), r2=25(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 94
LDI r2, 25
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
