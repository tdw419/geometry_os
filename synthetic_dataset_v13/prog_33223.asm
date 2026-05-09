; DESCRIPTION: Places a purple 91x39 rectangle at position (392, 150).
; PLAN: r0=392(x), r1=150(y), r2=91(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 150
LDI r2, 91
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
