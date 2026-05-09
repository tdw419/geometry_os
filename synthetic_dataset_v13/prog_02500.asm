; DESCRIPTION: Places a green 98x80 rectangle at position (180, 139).
; PLAN: r0=180(x), r1=139(y), r2=98(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 139
LDI r2, 98
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
