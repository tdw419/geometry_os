; DESCRIPTION: Places a yellow 19x50 rectangle at position (210, 75).
; PLAN: r0=210(x), r1=75(y), r2=19(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 75
LDI r2, 19
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
