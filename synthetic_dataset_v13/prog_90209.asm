; DESCRIPTION: Places a yellow 74x78 rectangle at position (196, 146).
; PLAN: r0=196(x), r1=146(y), r2=74(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 146
LDI r2, 74
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
