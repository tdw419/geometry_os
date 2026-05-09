; DESCRIPTION: Places a blue 38x44 rectangle at position (468, 135).
; PLAN: r0=468(x), r1=135(y), r2=38(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 135
LDI r2, 38
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
