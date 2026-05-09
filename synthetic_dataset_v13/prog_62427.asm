; DESCRIPTION: Places a yellow 20x74 rectangle at position (461, 59).
; PLAN: r0=461(x), r1=59(y), r2=20(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 59
LDI r2, 20
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
