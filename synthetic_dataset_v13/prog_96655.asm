; DESCRIPTION: Places a yellow 107x64 rectangle at position (315, 4).
; PLAN: r0=315(x), r1=4(y), r2=107(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 4
LDI r2, 107
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
