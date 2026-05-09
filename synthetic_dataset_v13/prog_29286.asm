; DESCRIPTION: Places a orange 80x35 rectangle at position (198, 20).
; PLAN: r0=198(x), r1=20(y), r2=80(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 20
LDI r2, 80
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
