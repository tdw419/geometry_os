; DESCRIPTION: Places a cyan 11x11 rectangle at position (489, 208).
; PLAN: r0=489(x), r1=208(y), r2=11(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 208
LDI r2, 11
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
