; DESCRIPTION: Places a yellow 49x71 rectangle at position (317, 16).
; PLAN: r0=317(x), r1=16(y), r2=49(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 16
LDI r2, 49
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
