; DESCRIPTION: Places a yellow 107x112 rectangle at position (174, 128).
; PLAN: r0=174(x), r1=128(y), r2=107(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 128
LDI r2, 107
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
