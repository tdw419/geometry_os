; DESCRIPTION: Places a blue 79x43 rectangle at position (245, 109).
; PLAN: r0=245(x), r1=109(y), r2=79(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 109
LDI r2, 79
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
