; DESCRIPTION: Places a yellow 23x34 rectangle at position (488, 127).
; PLAN: r0=488(x), r1=127(y), r2=23(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 127
LDI r2, 23
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
