; DESCRIPTION: Places a blue 109x90 rectangle at position (208, 44).
; PLAN: r0=208(x), r1=44(y), r2=109(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 44
LDI r2, 109
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
