; DESCRIPTION: Places a green 65x66 rectangle at position (113, 115).
; PLAN: r0=113(x), r1=115(y), r2=65(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 115
LDI r2, 65
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
