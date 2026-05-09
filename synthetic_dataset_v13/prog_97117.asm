; DESCRIPTION: Places a yellow 117x11 rectangle at position (230, 170).
; PLAN: r0=230(x), r1=170(y), r2=117(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 170
LDI r2, 117
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
