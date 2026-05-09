; DESCRIPTION: Places a green 102x90 rectangle at position (337, 129).
; PLAN: r0=337(x), r1=129(y), r2=102(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 129
LDI r2, 102
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
