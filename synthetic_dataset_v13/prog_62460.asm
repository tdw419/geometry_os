; DESCRIPTION: Places a yellow 89x28 rectangle at position (381, 213).
; PLAN: r0=381(x), r1=213(y), r2=89(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 213
LDI r2, 89
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
