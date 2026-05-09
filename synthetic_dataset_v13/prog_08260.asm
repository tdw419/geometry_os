; DESCRIPTION: Places a green 16x119 rectangle at position (410, 25).
; PLAN: r0=410(x), r1=25(y), r2=16(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 25
LDI r2, 16
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
