; DESCRIPTION: Places a yellow 25x61 rectangle at position (225, 178).
; PLAN: r0=225(x), r1=178(y), r2=25(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 178
LDI r2, 25
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
