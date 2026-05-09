; DESCRIPTION: Places a yellow 95x53 rectangle at position (195, 86).
; PLAN: r0=195(x), r1=86(y), r2=95(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 86
LDI r2, 95
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
