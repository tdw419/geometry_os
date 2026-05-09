; DESCRIPTION: Places a cyan 91x99 rectangle at position (20, 70).
; PLAN: r0=20(x), r1=70(y), r2=91(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 70
LDI r2, 91
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
