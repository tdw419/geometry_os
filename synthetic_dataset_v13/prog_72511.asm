; DESCRIPTION: Places a green 112x19 rectangle at position (50, 58).
; PLAN: r0=50(x), r1=58(y), r2=112(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 58
LDI r2, 112
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
