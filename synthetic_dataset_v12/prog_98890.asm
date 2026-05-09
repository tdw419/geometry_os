; DESCRIPTION: Places a blue 20x10 rectangle at position (465, 6).
; PLAN: r0=465(x), r1=6(y), r2=20(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 6
LDI r2, 20
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
