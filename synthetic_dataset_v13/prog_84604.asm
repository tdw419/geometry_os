; DESCRIPTION: Places a green 74x117 rectangle at position (400, 121).
; PLAN: r0=400(x), r1=121(y), r2=74(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 121
LDI r2, 74
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
