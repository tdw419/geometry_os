; DESCRIPTION: Places a cyan 94x50 rectangle at position (353, 11).
; PLAN: r0=353(x), r1=11(y), r2=94(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 11
LDI r2, 94
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
