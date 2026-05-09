; DESCRIPTION: Places a blue 118x79 rectangle at position (374, 164).
; PLAN: r0=374(x), r1=164(y), r2=118(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 164
LDI r2, 118
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
