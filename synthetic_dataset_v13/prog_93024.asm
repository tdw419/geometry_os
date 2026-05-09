; DESCRIPTION: Places a orange 90x17 rectangle at position (198, 229).
; PLAN: r0=198(x), r1=229(y), r2=90(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 229
LDI r2, 90
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
