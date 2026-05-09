; DESCRIPTION: Places a yellow 13x53 rectangle at position (493, 80).
; PLAN: r0=493(x), r1=80(y), r2=13(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 80
LDI r2, 13
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
