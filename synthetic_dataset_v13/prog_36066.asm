; DESCRIPTION: Places a yellow 86x120 rectangle at position (377, 80).
; PLAN: r0=377(x), r1=80(y), r2=86(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 80
LDI r2, 86
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
