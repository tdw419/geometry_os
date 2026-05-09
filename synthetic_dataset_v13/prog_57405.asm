; DESCRIPTION: Places a green 80x34 rectangle at position (296, 85).
; PLAN: r0=296(x), r1=85(y), r2=80(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 85
LDI r2, 80
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
