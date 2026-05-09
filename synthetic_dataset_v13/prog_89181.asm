; DESCRIPTION: Places a cyan 89x50 rectangle at position (222, 20).
; PLAN: r0=222(x), r1=20(y), r2=89(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 20
LDI r2, 89
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
