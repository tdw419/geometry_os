; DESCRIPTION: Places a red 16x19 rectangle at position (97, 225).
; PLAN: r0=97(x), r1=225(y), r2=16(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 225
LDI r2, 16
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
