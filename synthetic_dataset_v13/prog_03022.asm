; DESCRIPTION: Places a blue 33x47 rectangle at position (335, 208).
; PLAN: r0=335(x), r1=208(y), r2=33(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 208
LDI r2, 33
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
