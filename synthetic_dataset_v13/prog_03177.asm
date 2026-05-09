; DESCRIPTION: Places a purple 40x91 rectangle at position (450, 38).
; PLAN: r0=450(x), r1=38(y), r2=40(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 38
LDI r2, 40
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
