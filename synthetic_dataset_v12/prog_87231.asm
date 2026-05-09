; DESCRIPTION: Places a blue 12x48 rectangle at position (208, 161).
; PLAN: r0=208(x), r1=161(y), r2=12(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 161
LDI r2, 12
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
