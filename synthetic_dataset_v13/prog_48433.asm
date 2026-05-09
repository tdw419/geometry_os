; DESCRIPTION: Places a purple 120x99 rectangle at position (135, 38).
; PLAN: r0=135(x), r1=38(y), r2=120(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 38
LDI r2, 120
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
