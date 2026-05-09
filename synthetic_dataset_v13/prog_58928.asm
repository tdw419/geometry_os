; DESCRIPTION: Places a blue 113x74 rectangle at position (17, 86).
; PLAN: r0=17(x), r1=86(y), r2=113(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 86
LDI r2, 113
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
