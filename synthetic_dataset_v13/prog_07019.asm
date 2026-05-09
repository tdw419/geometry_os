; DESCRIPTION: Places a blue 83x120 rectangle at position (350, 91).
; PLAN: r0=350(x), r1=91(y), r2=83(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 91
LDI r2, 83
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
