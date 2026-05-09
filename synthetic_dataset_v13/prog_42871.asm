; DESCRIPTION: Places a yellow 77x96 rectangle at position (418, 107).
; PLAN: r0=418(x), r1=107(y), r2=77(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 107
LDI r2, 77
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
