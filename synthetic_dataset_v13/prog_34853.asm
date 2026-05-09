; DESCRIPTION: Places a green 57x25 rectangle at position (374, 168).
; PLAN: r0=374(x), r1=168(y), r2=57(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 168
LDI r2, 57
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
