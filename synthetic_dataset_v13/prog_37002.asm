; DESCRIPTION: Places a green 36x16 rectangle at position (147, 240).
; PLAN: r0=147(x), r1=240(y), r2=36(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 240
LDI r2, 36
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
