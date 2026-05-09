; DESCRIPTION: Places a cyan 40x80 rectangle at position (450, 43).
; PLAN: r0=450(x), r1=43(y), r2=40(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 43
LDI r2, 40
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
