; DESCRIPTION: Places a cyan 62x22 rectangle at position (445, 44).
; PLAN: r0=445(x), r1=44(y), r2=62(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 44
LDI r2, 62
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
