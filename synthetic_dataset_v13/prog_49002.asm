; DESCRIPTION: Places a yellow 73x60 rectangle at position (4, 180).
; PLAN: r0=4(x), r1=180(y), r2=73(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 180
LDI r2, 73
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
