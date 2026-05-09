; DESCRIPTION: Places a green 95x45 rectangle at position (193, 106).
; PLAN: r0=193(x), r1=106(y), r2=95(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 106
LDI r2, 95
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
