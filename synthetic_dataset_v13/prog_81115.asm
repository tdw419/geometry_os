; DESCRIPTION: Places a yellow 70x120 rectangle at position (200, 33).
; PLAN: r0=200(x), r1=33(y), r2=70(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 33
LDI r2, 70
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
