; DESCRIPTION: Places a green 54x25 rectangle at position (326, 3).
; PLAN: r0=326(x), r1=3(y), r2=54(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 3
LDI r2, 54
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
