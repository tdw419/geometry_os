; DESCRIPTION: Places a cyan 80x32 rectangle at position (391, 100).
; PLAN: r0=391(x), r1=100(y), r2=80(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 100
LDI r2, 80
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
