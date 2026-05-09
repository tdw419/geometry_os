; DESCRIPTION: Places a yellow 104x100 rectangle at position (195, 91).
; PLAN: r0=195(x), r1=91(y), r2=104(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 91
LDI r2, 104
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
