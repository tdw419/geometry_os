; DESCRIPTION: Places a cyan 68x40 rectangle at position (15, 38).
; PLAN: r0=15(x), r1=38(y), r2=68(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 38
LDI r2, 68
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
