; DESCRIPTION: Places a red 40x99 rectangle at position (256, 107).
; PLAN: r0=256(x), r1=107(y), r2=40(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 107
LDI r2, 40
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
