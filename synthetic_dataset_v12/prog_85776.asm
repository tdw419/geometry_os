; DESCRIPTION: Places a green 22x30 rectangle at position (432, 180).
; PLAN: r0=432(x), r1=180(y), r2=22(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 180
LDI r2, 22
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
