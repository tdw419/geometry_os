; DESCRIPTION: Places a green 74x11 rectangle at position (374, 211).
; PLAN: r0=374(x), r1=211(y), r2=74(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 211
LDI r2, 74
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
