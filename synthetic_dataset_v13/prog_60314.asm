; DESCRIPTION: Places a yellow 14x80 rectangle at position (443, 69).
; PLAN: r0=443(x), r1=69(y), r2=14(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 69
LDI r2, 14
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
