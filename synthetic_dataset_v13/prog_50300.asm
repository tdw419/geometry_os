; DESCRIPTION: Places a red 80x118 rectangle at position (296, 21).
; PLAN: r0=296(x), r1=21(y), r2=80(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 21
LDI r2, 80
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
