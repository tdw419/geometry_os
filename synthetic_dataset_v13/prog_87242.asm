; DESCRIPTION: Places a yellow 20x104 rectangle at position (415, 79).
; PLAN: r0=415(x), r1=79(y), r2=20(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 79
LDI r2, 20
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
