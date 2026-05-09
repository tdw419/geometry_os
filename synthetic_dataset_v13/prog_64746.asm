; DESCRIPTION: Places a yellow 36x94 rectangle at position (138, 146).
; PLAN: r0=138(x), r1=146(y), r2=36(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 146
LDI r2, 36
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
