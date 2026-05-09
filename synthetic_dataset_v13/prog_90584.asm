; DESCRIPTION: Places a blue 72x41 rectangle at position (413, 208).
; PLAN: r0=413(x), r1=208(y), r2=72(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 208
LDI r2, 72
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
