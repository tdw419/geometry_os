; DESCRIPTION: Places a blue 43x38 rectangle at position (46, 208).
; PLAN: r0=46(x), r1=208(y), r2=43(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 208
LDI r2, 43
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
