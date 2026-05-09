; DESCRIPTION: Places a blue 45x99 rectangle at position (186, 12).
; PLAN: r0=186(x), r1=12(y), r2=45(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 12
LDI r2, 45
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
