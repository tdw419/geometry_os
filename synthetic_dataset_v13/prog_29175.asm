; DESCRIPTION: Places a purple 113x64 rectangle at position (392, 33).
; PLAN: r0=392(x), r1=33(y), r2=113(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 33
LDI r2, 113
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
