; DESCRIPTION: Places a yellow 112x66 rectangle at position (317, 139).
; PLAN: r0=317(x), r1=139(y), r2=112(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 139
LDI r2, 112
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
