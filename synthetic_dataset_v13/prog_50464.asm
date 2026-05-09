; DESCRIPTION: Places a yellow 117x74 rectangle at position (108, 180).
; PLAN: r0=108(x), r1=180(y), r2=117(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 180
LDI r2, 117
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
