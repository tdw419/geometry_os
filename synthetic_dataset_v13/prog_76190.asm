; DESCRIPTION: Places a cyan 68x95 rectangle at position (159, 84).
; PLAN: r0=159(x), r1=84(y), r2=68(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 84
LDI r2, 68
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
