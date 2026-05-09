; DESCRIPTION: Places a green 32x112 rectangle at position (277, 123).
; PLAN: r0=277(x), r1=123(y), r2=32(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 123
LDI r2, 32
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
