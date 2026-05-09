; DESCRIPTION: Places a cyan 16x50 rectangle at position (170, 106).
; PLAN: r0=170(x), r1=106(y), r2=16(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 106
LDI r2, 16
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
