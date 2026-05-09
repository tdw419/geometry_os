; DESCRIPTION: Places a green 90x45 rectangle at position (377, 55).
; PLAN: r0=377(x), r1=55(y), r2=90(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 55
LDI r2, 90
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
