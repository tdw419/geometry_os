; DESCRIPTION: Places a blue 13x48 rectangle at position (295, 208).
; PLAN: r0=295(x), r1=208(y), r2=13(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 208
LDI r2, 13
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
