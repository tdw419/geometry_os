; DESCRIPTION: Places a green 25x10 rectangle at position (335, 132).
; PLAN: r0=335(x), r1=132(y), r2=25(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 132
LDI r2, 25
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
