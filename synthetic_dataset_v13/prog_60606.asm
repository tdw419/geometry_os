; DESCRIPTION: Places a yellow 104x44 rectangle at position (70, 103).
; PLAN: r0=70(x), r1=103(y), r2=104(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 103
LDI r2, 104
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
