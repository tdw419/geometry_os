; DESCRIPTION: Places a yellow 104x11 rectangle at position (290, 75).
; PLAN: r0=290(x), r1=75(y), r2=104(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 75
LDI r2, 104
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
