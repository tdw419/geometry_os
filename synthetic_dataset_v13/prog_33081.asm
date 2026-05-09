; DESCRIPTION: Places a red 40x84 rectangle at position (349, 164).
; PLAN: r0=349(x), r1=164(y), r2=40(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 164
LDI r2, 40
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
