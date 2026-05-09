; DESCRIPTION: Draws a green rectangle at (387, 74) with width 98 and height 64.
; PLAN: r0=387(x), r1=74(y), r2=98(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 74
LDI r2, 98
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
