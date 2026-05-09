; DESCRIPTION: Places a cyan 80x98 rectangle at position (411, 60).
; PLAN: r0=411(x), r1=60(y), r2=80(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 60
LDI r2, 80
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
