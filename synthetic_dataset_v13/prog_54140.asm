; DESCRIPTION: Places a yellow 93x21 rectangle at position (112, 193).
; PLAN: r0=112(x), r1=193(y), r2=93(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 193
LDI r2, 93
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
