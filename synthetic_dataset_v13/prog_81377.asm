; DESCRIPTION: Places a yellow 40x48 rectangle at position (411, 2).
; PLAN: r0=411(x), r1=2(y), r2=40(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 2
LDI r2, 40
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
