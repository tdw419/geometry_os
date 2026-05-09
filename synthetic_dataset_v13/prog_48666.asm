; DESCRIPTION: Places a blue 86x50 rectangle at position (169, 107).
; PLAN: r0=169(x), r1=107(y), r2=86(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 107
LDI r2, 86
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
