; DESCRIPTION: Places a yellow 35x48 rectangle at position (301, 131).
; PLAN: r0=301(x), r1=131(y), r2=35(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 131
LDI r2, 35
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
