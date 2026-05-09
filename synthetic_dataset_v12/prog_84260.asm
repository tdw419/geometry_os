; DESCRIPTION: Places a blue 70x75 rectangle at position (441, 91).
; PLAN: r0=441(x), r1=91(y), r2=70(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 91
LDI r2, 70
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
