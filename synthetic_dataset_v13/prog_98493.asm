; DESCRIPTION: Places a yellow 74x20 rectangle at position (374, 63).
; PLAN: r0=374(x), r1=63(y), r2=74(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 63
LDI r2, 74
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
