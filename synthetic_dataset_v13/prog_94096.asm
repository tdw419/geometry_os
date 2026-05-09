; DESCRIPTION: Places a purple 95x25 rectangle at position (251, 231).
; PLAN: r0=251(x), r1=231(y), r2=95(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 231
LDI r2, 95
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
