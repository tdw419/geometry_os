; DESCRIPTION: Places a yellow 83x10 rectangle at position (95, 195).
; PLAN: r0=95(x), r1=195(y), r2=83(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 195
LDI r2, 83
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
