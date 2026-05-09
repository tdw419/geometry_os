; DESCRIPTION: Places a blue 87x44 rectangle at position (410, 10).
; PLAN: r0=410(x), r1=10(y), r2=87(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 10
LDI r2, 87
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
