; DESCRIPTION: Places a cyan 50x37 rectangle at position (451, 213).
; PLAN: r0=451(x), r1=213(y), r2=50(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 213
LDI r2, 50
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
