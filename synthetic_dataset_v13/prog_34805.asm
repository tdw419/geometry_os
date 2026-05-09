; DESCRIPTION: Places a yellow 107x73 rectangle at position (242, 56).
; PLAN: r0=242(x), r1=56(y), r2=107(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 56
LDI r2, 107
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
