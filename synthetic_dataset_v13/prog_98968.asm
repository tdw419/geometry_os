; DESCRIPTION: Places a yellow 94x23 rectangle at position (146, 129).
; PLAN: r0=146(x), r1=129(y), r2=94(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 129
LDI r2, 94
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
