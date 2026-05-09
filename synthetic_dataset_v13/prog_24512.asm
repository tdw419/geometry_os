; DESCRIPTION: Places a yellow 85x85 rectangle at position (165, 91).
; PLAN: r0=165(x), r1=91(y), r2=85(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 91
LDI r2, 85
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
