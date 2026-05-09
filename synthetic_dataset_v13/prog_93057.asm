; DESCRIPTION: Places a yellow 26x22 rectangle at position (317, 29).
; PLAN: r0=317(x), r1=29(y), r2=26(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 29
LDI r2, 26
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
