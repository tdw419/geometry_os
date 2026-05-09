; DESCRIPTION: Places a yellow 102x66 rectangle at position (279, 10).
; PLAN: r0=279(x), r1=10(y), r2=102(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 10
LDI r2, 102
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
