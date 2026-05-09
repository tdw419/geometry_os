; DESCRIPTION: Places a yellow 117x30 rectangle at position (57, 107).
; PLAN: r0=57(x), r1=107(y), r2=117(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 107
LDI r2, 117
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
