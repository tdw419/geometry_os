; DESCRIPTION: Places a yellow 14x14 rectangle at position (196, 210).
; PLAN: r0=196(x), r1=210(y), r2=14(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 210
LDI r2, 14
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
