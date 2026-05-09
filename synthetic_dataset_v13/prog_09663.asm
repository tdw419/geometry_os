; DESCRIPTION: Places a yellow 48x70 rectangle at position (389, 43).
; PLAN: r0=389(x), r1=43(y), r2=48(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 43
LDI r2, 48
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
