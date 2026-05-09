; DESCRIPTION: Places a yellow 76x15 rectangle at position (230, 134).
; PLAN: r0=230(x), r1=134(y), r2=76(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 134
LDI r2, 76
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
