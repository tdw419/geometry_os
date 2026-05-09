; DESCRIPTION: Places a yellow 104x81 rectangle at position (320, 161).
; PLAN: r0=320(x), r1=161(y), r2=104(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 161
LDI r2, 104
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
