; DESCRIPTION: Places a blue 10x80 rectangle at position (202, 138).
; PLAN: r0=202(x), r1=138(y), r2=10(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 138
LDI r2, 10
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
