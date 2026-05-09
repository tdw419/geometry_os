; DESCRIPTION: Places a yellow 65x120 rectangle at position (159, 136).
; PLAN: r0=159(x), r1=136(y), r2=65(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 136
LDI r2, 65
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
