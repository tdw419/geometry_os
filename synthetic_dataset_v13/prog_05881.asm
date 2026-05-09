; DESCRIPTION: Places a yellow 13x100 rectangle at position (342, 25).
; PLAN: r0=342(x), r1=25(y), r2=13(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 25
LDI r2, 13
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
