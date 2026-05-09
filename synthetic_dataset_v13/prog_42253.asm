; DESCRIPTION: Places a yellow 94x71 rectangle at position (150, 159).
; PLAN: r0=150(x), r1=159(y), r2=94(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 159
LDI r2, 94
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
