; DESCRIPTION: Places a green 97x19 rectangle at position (352, 29).
; PLAN: r0=352(x), r1=29(y), r2=97(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 29
LDI r2, 97
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
