; DESCRIPTION: Places a blue 40x91 rectangle at position (182, 164).
; PLAN: r0=182(x), r1=164(y), r2=40(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 164
LDI r2, 40
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
