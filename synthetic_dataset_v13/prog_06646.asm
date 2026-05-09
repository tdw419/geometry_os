; DESCRIPTION: Places a purple 40x111 rectangle at position (392, 46).
; PLAN: r0=392(x), r1=46(y), r2=40(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 46
LDI r2, 40
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
